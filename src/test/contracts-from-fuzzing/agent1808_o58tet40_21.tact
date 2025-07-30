struct A {
 x: Int
}

struct B {
 a: A
}

contract OptChain {
 y: B?;

 init() {
  self.y = B{ a: A{ x: 1 } };
 }
}