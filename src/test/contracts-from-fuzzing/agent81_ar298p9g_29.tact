struct Zero { z: Int; }
struct One { o: Zero; }
struct Two { t: One; }
struct Three { th: Two; }
struct Four { f: Three; }

contract DeepChain {
  s: Four;

  init() {
    self.s = Four{ f: Three{ th: Two{ t: One{ o: Zero{ z: 1 } } } } };
  }
}