'use strict'

angular.module 'ddosApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
	$scope.options = {}

	$scope.send = ->
		if $scope.options.method = 'get'
			address = if $scope.options.data then $scope.options.address + '/' + $scope.options.data else $scope.options.address
			i = 0
			while i < $scope.options.number
				$http.get(address).success (data, status) ->
					console.log('server respond: ' + status + ' ' + data)
				.error (data, status) ->
					console.log('server respond: ' + status + ' ' + data)
				i++
		if $scope.options.method = 'post'
			i = 0
			while i < $scope.options.number
				$http.post('http://localhost:8000/api/orders', $scope.options.data).success (data, status) ->
					console.log('server respond: ' + status + ' ' + data)
				.error (data, status) ->
					console.log('server respond: ' + status + ' ' + data)
				i++