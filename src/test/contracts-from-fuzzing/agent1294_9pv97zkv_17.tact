struct S1 { n: Int; }
struct S2 { text: String; }

contract PartialDefaults {
  foo: S1;
  bar: S2 = S2{ text: "hi" };

  init() {
    self.foo = S1{ n: 10 };
  }
}