// Crossed optional and nested with assignment
struct L1 {
  a: Int?;
}

struct L2 {
  l1: L1;
  b: Bool;
}

struct L3 {
  l2: L2?;
}

contract CrossOptional {
  val: L3;
  init() {
    self.val = L3 {
      l2: L2 {
        l1: L1 { a:null },
        b: true
      }
    };
  }
}