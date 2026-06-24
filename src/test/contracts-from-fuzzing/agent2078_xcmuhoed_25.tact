struct A {
 x: Int?;
}

struct B {
 a1: A?;
 a2: A?;
}

contract NestOpt {
 b: B = B{ a1: null, a2: null };
 init() {}
}