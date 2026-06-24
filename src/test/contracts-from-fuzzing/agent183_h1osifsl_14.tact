struct Inner {
  x: Int;
  y: Int;
}

contract NestedVar {
    a: Int = 1;
    b: Inner = Inner{x:2, y:3};

    init() {
        self.a = 7;
        self.b = Inner{x:9, y:11};
    }
}