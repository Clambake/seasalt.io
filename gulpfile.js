var gulp         = require('gulp');
var sass         = require('gulp-sass');
var sourcemaps   = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var concat       = require('gulp-concat');

var autoprefixerOptions = {
  browsers: ['last 2 versions'],
};

gulp.task('sass', function() {
  gulp.src('assets/_sass/**/*')
    .pipe(sourcemaps.init())
    .pipe(sass({
      indentedSyntax: true,
      outputStyle: 'compressed',
      errLogToConsole: true,
      includePaths: [
        'node_modules/susy/sass/'
      ]
    }).on('error', sass.logError))
    .pipe(autoprefixer(autoprefixerOptions))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('assets/css/'));
});

gulp.task('watch', function() {
  gulp.watch('assets/_sass/**/*.sass', ['sass']);
});

// Default Task
gulp.task('default', [
  'sass',
  'watch'
]);

gulp.task('build', [
  'sass',
]);
