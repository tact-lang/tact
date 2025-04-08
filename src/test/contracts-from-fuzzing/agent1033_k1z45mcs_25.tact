struct S {
  val: Int;
}

contract StorageOrder {
    s1: S;
    n: Int;
    s2: S;

    init() {
        self.s1 = S{ val: 1 };
        self.n = 2;
        self.s2 = S{ val: 3 };
    }
}