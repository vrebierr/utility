'use strict'

angular.module 'ddosApp'
.controller 'MainCtrl', ($scope, $http, socket) ->
	$scope.options = {}

	$scope.send = ->
		if $scope.options.method = 'get'
			address = $scope.options.address + '/' + $scope.options.data
			$http.get(address).success (data, status) ->
				i = 0
				while i < $scope.options.number
					console.log('server respond: ' + status + ' ' + data)
					i++