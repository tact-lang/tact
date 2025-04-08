struct Foo { a: Int; b: Int }
contract Punning {
  data: Foo;
  init() {
    let a = 42;
    self.data = Foo{
      a,
      b: 100
    };
  }
}