struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract BoolsTest {
    m: MultiBool;

    init() {
        self.m = MultiBool{
            a: true, b: false, c: true, d: false, e: true
        };
    }
}