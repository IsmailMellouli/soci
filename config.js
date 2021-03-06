var port = 8902;

module.exports = {
    'port': port,
    // 'facebookAuth' : {
    // 'clientID': 'id',
    // 'clientSecret': 'secret',
    //     'callbackURL'   : 'http://api.non.io:' + port + '/users/facebook/callback'
    // },
    // 'twitterAuth' : {
    // 'clientID': 'id',
    // 'clientSecret': 'secret',
    //     'callbackURL'   : 'http://api.non.io:' + port + '/users/twitter/callback'
    // },
    // 'googleAuth' : {
    // 'clientID': 'id',
    // 'clientSecret': 'secret',
    //     'callbackURL'   : 'http://api.non.io:' + port + '/users/google/callback'
    // }
    'facebookAuth': {
        'clientID': 'id',
        'clientSecret': 'secret',
        'callbackURL': 'http://localhost:' + port + '/users/facebook/callback'
    },
    'twitterAuth': {
        'consumerKey': 'id',
        'consumerSecret': 'secret',
        'callbackURL': 'http://localhost:' + port + '/users/twitter/callback'
    },
    'googleAuth': {
        'clientID': 'id',
        'clientSecret': 'secret',
        'callbackURL': 'http://localhost:' + port + '/users/google/callback'
    }
};