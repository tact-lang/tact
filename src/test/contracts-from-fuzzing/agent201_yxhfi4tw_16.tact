struct Leaf { v: Int = 0; }

struct B {
  i: Int = 1;
  l: Leaf?;
}

struct A {
  b: B?;
  flag: Bool = false;
}

contract Test16 {
  s: A = A{ b: null };
}