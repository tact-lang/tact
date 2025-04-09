struct Inner {
    x: Int; y: Int;
}
struct Outer {
    a: Int;
    b: Inner;
    c: Int;
}

contract MiddleStruct {
    s: Outer;

    init() {
        self.s = Outer{ a:11, b:Inner{ x:22, y:33 }, c:44 };
    }
}