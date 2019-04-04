const pureForest = require('./build.js');

exports.generateForest = function(x, y) {
  return pureForest.generate(Math.round(Math.random() * 10000) + 1)(x)(y);
}
