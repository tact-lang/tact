struct InnerConst {
    a: Int;
}

contract ConstInitFields {
    foo: Int = 17;
    bar: Bool = true;
    baz: InnerConst = InnerConst{a:5};

    init() {
      self.foo = 42;
      self.bar = false;
      self.baz = InnerConst{a:9};
    }
}