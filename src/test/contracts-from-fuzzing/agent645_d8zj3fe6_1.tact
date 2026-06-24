struct S {
    x1: Int;
    x2: Bool?;
    x3: String;
    x4: Int?;
    x5: Bool;
    x6: String?;
}

contract C {
    s: S;

    init() {
        self.s = S{
            x1: 1,
            x2: true,
            x3: "abc",
            x4: null,
            x5: false,
            x6: null,
        };
    }
}
