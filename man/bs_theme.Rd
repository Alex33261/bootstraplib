% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bs-theme.R
\name{bs_theme}
\alias{bs_theme}
\alias{bs_theme_update}
\alias{is_bs_theme}
\title{Create a Bootstrap theme}
\usage{
bs_theme(
  version = version_default(),
  bootswatch = NULL,
  ...,
  bg = NULL,
  fg = NULL,
  primary = NULL,
  secondary = NULL,
  success = NULL,
  info = NULL,
  warning = NULL,
  danger = NULL,
  base_font = NULL,
  code_font = NULL,
  heading_font = NULL
)

bs_theme_update(
  theme,
  ...,
  bg = NULL,
  fg = NULL,
  primary = NULL,
  secondary = NULL,
  success = NULL,
  info = NULL,
  warning = NULL,
  danger = NULL,
  base_font = NULL,
  code_font = NULL,
  heading_font = NULL
)

is_bs_theme(x)
}
\arguments{
\item{version}{The major version of Bootstrap to use. A value of \code{'4+3'}
means Bootstrap 4, but with additional CSS/JS to support BS3 style markup
in BS4. Other supported versions include 3 and 4.}

\item{bootswatch}{The name of a bootswatch theme (see \code{\link[=bootswatch_themes]{bootswatch_themes()}}
for possible values).}

\item{...}{arguments passed along to \code{\link[=bs_add_variables]{bs_add_variables()}}.}

\item{bg}{A color string for the background.}

\item{fg}{A color string for the foreground.}

\item{primary}{A color to be used for hyperlinks, to indicate primary/default
actions, and to show active selection state in some Bootstrap components.
Generally a bold, saturated color that contrasts with the theme's base
colors.}

\item{secondary}{A color for components and messages that don't need to stand
out. (Not supported in Bootstrap 3.)}

\item{success}{A color for messages that indicate an operation has succeeded.
Typically green.}

\item{info}{A color for messages that are informative but not critical.
Typically a shade of blue-green.}

\item{warning}{A color for warning messages. Typically yellow.}

\item{danger}{A color for errors. Typically red.}

\item{base_font}{The default typeface.}

\item{code_font}{The typeface to be used for code. Be sure this is monospace!}

\item{heading_font}{The typeface to be used for heading elements.}

\item{theme}{a \code{\link[=bs_theme]{bs_theme()}} object.}

\item{x}{an object.}
}
\description{
Creates a Bootstrap theme object which can be:
\itemize{
\item Used in any HTML page powered by \code{\link[shiny:bootstrapLib]{shiny::bootstrapLib()}} (e.g.,
\code{\link[shiny:fluidPage]{shiny::fluidPage()}}, \code{\link[shiny:bootstrapPage]{shiny::bootstrapPage()}}, etc).
\item Used in any output format powered by \code{\link[rmarkdown:html_document]{rmarkdown::html_document()}}
(or \code{\link[rmarkdown:html_document_base]{rmarkdown::html_document_base()}}).
\item Used more generally in any \link[htmltools:builder]{htmltools::tags} via \code{\link[=bs_theme_dependencies]{bs_theme_dependencies()}}.
}

These functions (i.e., \code{bs_theme()} or \code{bs_theme_update()}) allow you to do
the following common Bootstrap customization(s):
\itemize{
\item Choose a (major) Bootstrap version.
\item Choose a \href{https://bootswatch.com}{Bootswatch theme} (optional).
\item Customize main colors and fonts via explicitly named arguments (e.g.,
\code{bg}, \code{fg}, \code{primary}, etc).
\item Customize other, lower-level, Bootstrap Sass variable defaults via \code{...}
\itemize{
\item See all \href{https://github.com/rstudio/bootstraplib/blob/master/inst/lib/bootstrap/scss/_variables.scss}{Bootstrap 4 variables}
\item See all \href{https://github.com/rstudio/bootstraplib/blob/master/inst/lib/bootstrap-sass/assets/stylesheets/bootstrap/_variables.scss}{Bootstrap 3 variables}
}
}

For less common theming customization(s), you can modify theme objects to:
\itemize{
\item Add additional Sass/CSS rules (see \code{\link[=bs_add_rules]{bs_add_rules()}} and \code{\link[=sass_partial]{sass_partial()}}).
\item Leverage (new) Sass functions and mixins in those rules (see
\code{\link[=bs_add_declarations]{bs_add_declarations()}})
}

These lower-level theming tools build on the concept of a
\code{\link[sass:sass_layer]{sass::sass_layer()}}. To learn more, \href{https://rstudio.github.io/sass/articles/sass.html#composable-sass}{see here}.
}
\section{Colors}{


Colors may be provided in any format that \code{\link[htmltools:parseCssColors]{htmltools::parseCssColors()}} can
understand. To control the vast majority of the ('grayscale') color
defaults, specify both the \code{fg} (foreground) and \code{bg} (background) colors.
The \code{primary} and \code{secondary} theme colors are also useful for accenting the
main grayscale colors in things like hyperlinks, tabset panels, and buttons.
}

\section{Fonts}{


Use \code{base_font}, \code{code_font}, and \code{heading_font} to control the main
typefaces. These arguments set new defaults for the relevant \code{font-family}
CSS properties \strong{which does not guarantee the relevant fonts are available
in the users system}. To ensure the fonts are actually available, use a
package like \strong{gfonts} (if Google Fonts) to download and provide the font
files with the HTML site.

Each \verb{*_font} argument accepts a character vector where each element of that
vector can a single unquoted font family name, a single quoted font family
name, or a comma-separated list of font families (with individual font
family names quoted as necessary). The comma-separated list is useful for
specifying "fallback" font families (e.g., generic CSS families like
\code{sans-serif} or \code{serif}) when font(s) may be unavailable.

For example, each example below is valid:\preformatted{# Single, unquoted
bs_theme(base_font = "Source Sans Pro")
# Single, quoted
bs_theme(base_font = "'Source Sans Pro'")
# Multiple, quoted
bs_theme(base_font = "'Source Sans Pro', sans-serif")
# Combining all of the above
bs_theme(
  base_font = c("Open Sans", "'Source Sans Pro'",
  "'Helvetica Neue', Helvetica, sans-serif")
)
}

But the following is \emph{technically} not valid because \verb{Source Sans Pro} is
not quoted (the resulting CSS will contain \verb{font-family: Source Sans Pro, sans-serif;} which is technically out of the CSS specifications but may
still work in some modern browsers).\preformatted{bs_theme(base_font = "Source Sans Pro, sans-serif")
}
}

\examples{

theme <- bs_theme(
  # Controls the default grayscale palette
  bg = "#202123", fg = "#B8BCC2",
  # Controls the accent (e.g., hyperlink, button, etc) colors
  primary = "#EA80FC", secondary = "#48DAC6",
  base_font = c("Grandstander", "sans-serif"),
  code_font = c("Courier", "monospace"),
  heading_font = "'Helvetica Neue', Helvetica, sans-serif",
  # Can also add lower-level customization
  "input-border-color" = "#EA80FC"
)
if (interactive()) {
  bs_theme_preview(theme)
}

# Lower-level bs_add_*() functions allow you to work more
# directly with the underlying Sass code
theme <- theme \%>\%
  bs_add_variables("my-class-color" = "red") \%>\%
  bs_add_rules(".my-class { color: $my-class-color }")

}
\references{
\url{https://getbootstrap.com/docs/4.4/getting-started/theming/}

\url{https://rstudio.github.io/sass/}
}
\seealso{
\code{\link[=bs_add_variables]{bs_add_variables()}}, \code{\link[=bs_theme_preview]{bs_theme_preview()}},
\code{\link[=bs_theme_dependencies]{bs_theme_dependencies()}}, \code{\link[=bs_global_set]{bs_global_set()}}
}
