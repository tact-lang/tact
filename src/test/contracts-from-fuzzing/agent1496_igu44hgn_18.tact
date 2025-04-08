struct Wrap {
    val: Int?;
}

contract TestContract {
    a: Wrap?;
    b: Wrap;
    c: Wrap?;
    d: Wrap;
    init() {
        self.a = null;
        self.b = Wrap{ val: null };
        self.c = null;
        self.d = Wrap{ val: 42 };
    }
}