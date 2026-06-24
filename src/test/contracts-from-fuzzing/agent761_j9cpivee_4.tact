struct A { x: Int }
struct B { y: Int }

struct Combined {
  a: A;
  b: B;
  num: Int;
  flag: Bool;
  optText: String?;
}

contract StructMix {
  data: Combined;
  
  init() {
    self.data = Combined{
      a: A{ x: 1 },
      b: B{ y: 2 },
      num: 42,
      flag: true,
      optText: null,
    };
  }
}