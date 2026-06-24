// Nested optional-structure chain with some assigned deep
struct AOpt { x: Int?; }
struct BOpt { a: AOpt?; }
struct COpt { b: BOpt?; }

contract DeepChainOpt {
  c: COpt;
  init() {
    self.c = COpt { b: BOpt { a: AOpt { x:null } } };
  }
}