function fn() {
    karate.configure('connectTimeout', 60000);
    karate.configure('readTimeout', 60000);
    karate.configure('logPrettyResponse', true);

    var env = karate.env; // get system property 'karate.env'
    var platform = karate.properties['karate.platform'];
    var company = karate.properties['karate.company'];
    var systemPath = java.lang.System.getenv('PATH');

  karate.log('karate.env system property was:', env);
  karate.log('karate.platform system property was:', platform);
  karate.log('karate.company system property was:', company);
  karate.log('SystemPath', systemPath);

  if (!env) {
    env = 'dev';
  }

  return config;
}