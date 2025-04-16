struct DeepA {
 x: Int;
}

struct DeepB {
 a: DeepA;
}

struct DeepC {
 b: DeepB;
}

struct DeepD {
 c: DeepC;
}

struct Outer {
 d: DeepD;
 e: Int;
}

contract Nest { 
 val: Outer;
 init() {
  self.val = Outer{
    d: DeepD{ c: DeepC{ b: DeepB{ a: DeepA{ x: 5 } } } },
    e: 9
  };
 }
}