ngMeteor.config [
    '$routeProvider'
    '$locationProvider'
    ($routeProvider, $locationProvider) ->
        $routeProvider
            .when('/blogs', 
                templateUrl: '/views/blog/list.html'
                controller: 'BlogCtrl'
            )

            .when('/blogs/create', 
                templateUrl: '/views/blog/form.html'
                controller: 'BlogCtrl'
            )

            .when('/blogs/edit/:id', 
                templateUrl: '/views/blog/form.html'
                controller: 'BlogCtrl'
            )

            .when('/blogs/:id', 
                templateUrl: '/views/blog/detail.html'
                controller: 'BlogCtrl'
            )

            .otherwise(
                redirectTo: '/blogs'
            )
        $locationProvider.html5Mode true
]

