struct A { x: Int }
struct B { y: Int }
struct C { z: Int }

struct NestAll {
  a: A;
  b: B?;
  c: C;
}

contract MixOptionalNested {
  data: NestAll;

  init() {
    self.data = NestAll{
      a: A{ x: 1 },
      b: null,
      c: C{ z: 2 },
    };
  }
}