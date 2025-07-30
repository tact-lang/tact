struct Mixed {
    i: Int;
    o: Int?;
    b: Bool;
    ob: Bool?;
    s: String;
    os: String?;
}

contract Test {
    f: Mixed;
    init() {
        self.f = Mixed{
            i: 5,
            o: null,
            b: true,
            ob: null,
            s: "hi",
            os: null,
        };
    }
}
