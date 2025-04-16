struct A {
  x: Int; 
}
struct B {
  a: A;
}
contract InlineDefaults {
  s: B = B{a: A{x: 42}};
}
