struct S1 {
    x: Int as int64;
    y: Bool;
}

struct S2 {
    c: Cell;
    z: String;
}

contract MultiTypes {
    s1: S1;
    s2: S2;
    b: Bool;
    num: Int;
    s: String;
    sl: Slice;
    init() {
        self.s1 = S1{ x: 5, y: true };
        self.s2 = S2{ c: emptyCell(), z: "hi" };
        self.b = false;
        self.num = 42;
        self.s = "test";
        self.sl = emptyCell().asSlice();
    }
    receive() {
        self.num = 256;
    }
}