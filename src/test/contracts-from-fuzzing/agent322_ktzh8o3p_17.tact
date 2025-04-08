struct Child {
  foo: Int;
  bar: String?;
}
struct Parent {
  a: Int?;
  c: Child?;
}
contract ComplexOptionals {
  conf: Parent = Parent{ a: null, c: null };
}