struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: Int?;
    e: Bool?;
    f: S1;
}

contract TestContract {
    complex: S2;

    init() {
        self.complex = S2{
            c: "hi",
            d: null,
            e: true,
            f: S1{a: 5, b: false},
        };
    }
}