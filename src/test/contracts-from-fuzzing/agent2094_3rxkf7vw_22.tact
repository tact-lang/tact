struct Alpha {
    x: Int;
    y: Bool;
}

struct Beta {
    s: String;
    f: Address?;
}

contract MultiComplex {
    a: Alpha;
    b: Beta;
    init() {
        self.a = Alpha{ x: 7, y: true };
        self.b = Beta{ s: "B", f: null };
    }
    receive() {}
}
