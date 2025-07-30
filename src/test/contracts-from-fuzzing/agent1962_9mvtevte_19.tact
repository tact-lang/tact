struct I { x: Int; }
struct S { foo: I?; bar: Int; baz: String; }

contract NestedOpt {
  s: S;
  sopt: S?;

  init() {
    self.s = S{foo:null,bar:1,baz:"s"};
    self.sopt = null;
  }
}