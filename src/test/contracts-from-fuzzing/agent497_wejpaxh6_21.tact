struct InnerS {
  foo: Int;
  bar: String;
}

contract TestContract {
  a: InnerS;
  b: InnerS?;

  init() {
    self.a = InnerS{foo: 1, bar: "hi"};
    self.b = InnerS{foo: 2, bar: "yo"};
  }
}