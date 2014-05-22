ngMeteor.controller 'BlogCtrl', [
    '$scope'
    '$routeParams'
    '$collection'
    '$rootScope'
    '$location'
    ($scope, $routeParams, $collection, $rootScope, $location) ->
        
        $collection("blogs", $scope, {}, {sort: {createTime: -1}})

        if $routeParams.id
            $scope.blog = blogs.findOne({_id: $routeParams.id})

        $scope.save = (blog) ->
            if !blog._id
                blog.createTime = new Date()
            blog.updateTime = new Date()
            $scope.blogs.add blog
            $scope.blog = null
            $location.path '/blogs'

        $scope.del = (blog) ->
            $scope.blogs.delete blog
            $scope.blog = null
            $location.path '/blogs'
]
