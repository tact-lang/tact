struct ParamTest {
    i: Int;
    b: Bool;
    s: String;
}

contract MultiTypeFields {
    p: ParamTest;
    n: Int;
    f: Bool;
    t: String;

    init() {
        self.p = ParamTest{ i: 123, b: true, s: "ok" };
        self.n = 42;
        self.f = false;
        self.t = "test";
    }
}