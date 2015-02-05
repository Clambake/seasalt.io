module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON('package.json')

    bower_concat:
      all:
        dest: 'tmp/vendor.js',

    uglify:
      vendor:
        files:
          'assets/js/vendor.js': ['tmp/vendor.js']
      js:
        files:
          'assets/js/app.js': ['tmp/app.js']

    coffee:
      compile:
        files:
          "tmp/app.js" : ['_app/js/**/*.coffee']

    watch:
      app:
        files: [
          '_app/js/**/*.coffee'
        ]
        tasks: [
          'coffee'
          'uglify:js'
        ]
        options:
          debounceDelay: 100


  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'default', ['bower_concat', 'coffee', 'uglify', 'watch']

  return