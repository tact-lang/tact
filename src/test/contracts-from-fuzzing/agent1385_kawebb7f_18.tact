struct InnerS { f: Int; }

contract StructDefault {
  foo: InnerS = InnerS{ f: 7 };

  init() {
    self.foo = InnerS{ f: 42 };
  }
}