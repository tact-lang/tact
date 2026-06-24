struct Comp1 {
  a: Int;
}
struct Comp2 {
  b: Int;
}
struct Comp3 {
  c: Int;
}

contract ManyFields {
  f1: Comp1 = Comp1{ a:1 };
  f2: Comp2 = Comp2{ b:2 };
  f3: Comp3 = Comp3{ c:3 };
  i1: Int = 10;
  i2: Int = 20;
  i3: Int = 30;
  i4: Int = 40;
  flag1: Bool = false;
  flag2: Bool = true;
  s1: String = "abc";
  s2: String = "def";
}