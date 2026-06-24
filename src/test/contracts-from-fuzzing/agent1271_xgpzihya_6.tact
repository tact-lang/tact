struct S {
  x: Int;
  y: Bool;
}

contract OptStruct {
    nested: S?;
    init() {
        self.nested = S{ x: 0, y: false };
    }
    receive() {}
}