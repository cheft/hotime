ngMeteor.controller 'BlogDetailCtrl', [
    '$scope'
    '$routeParams'
    ($scope, $routeParams) -> 
        blogs.findOne _id: $routeParams.id
        console.log $routeParams.id, 111, _blog
        $scope.blog = _blog
]

ngMeteor.controller 'BlogCtrl', [
    '$scope'
    '$routeParams'
    '$collection'
    '$location'
    ($scope, $routeParams, $collection, $location) ->
        
        if $routeParams.id
            $scope.blog = blogs.findOne({_id: $routeParams.id})

        $collection("blogs", $scope, {}, {sort: {createTime: -1}})

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

        # $scope.$watch 'value', ->
        #     $ ->
        #         $('#tags').chosen width: '100%'
        #         bkLib.onDomLoaded ->
        #             contentEditor = new nicEditor
        #                 buttonList: [
        #                     'bold',
        #                     'italic',
        #                     'underline',
        #                     'forecolor',
        #                     'left',
        #                     'center',
        #                     'right',
        #                     'justify'
        #                 ]
        #             contentEditor.panelInstance 'content'


]

