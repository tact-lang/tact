struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract BoolStructTest {
    val: MultiBool;

    init() {
        self.val = MultiBool{
            a: true, b: false, c: true, d: false,
            e: true, f: false, g: true, h: false
        };
    }
}