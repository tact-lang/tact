struct C1 {
    i: Int;
    s: String;
    bo: Bool;
    si: Int?;
    ss: String?;
    bb: Bool?;
}

contract ComplexStorage {
    a: C1;

    init() {
        self.a = C1{
            i: 1,
            s: "q",
            bo: true,
            si: null,
            ss: null,
            bb: null
        };
    }
}