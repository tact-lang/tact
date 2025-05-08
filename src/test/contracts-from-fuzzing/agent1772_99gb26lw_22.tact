struct S1 {
    x: Int;
    y: Int?;
}

struct S2 {
    a: Bool;
    b: S1?;
    c: String;
}

contract Test22 {
    s: S2;

    init() {
        self.s = S2{
            a: false,
            b: S1{ x: 9, y: null },
            c: "hi"
        };
    }
}