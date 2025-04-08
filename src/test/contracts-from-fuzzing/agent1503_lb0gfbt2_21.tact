struct S1 {
    a: Int;
    b: String?;
}

struct S2 {
    s: S1?;
    c: String;
}

contract OptionalStructField {
    s2: S2;

    init() {
        self.s2 = S2 {
            s: S1 { a: 42, b: null },
            c: "hello"
        };
    }

    receive() {}
}