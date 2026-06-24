struct Both {
  foo: Int;
  bar: Bool?;
}

contract OptsInsideStruct {
    nested: Both;

    init() {
        self.nested = Both{ foo: 1, bar: null };
    }
}