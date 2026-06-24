struct Inner {
    innerVal: Int;
}

contract Outer {
    i: Inner;
    o: Inner;
    x: Int;
    y: Bool;
    s: String;

    init() {
        self.i = Inner{ innerVal: 1 };
        self.o = Inner{ innerVal: 2 };
        self.x = 3;
        self.y = true;
        self.s = "hi";
    }
}