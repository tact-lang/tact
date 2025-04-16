struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: S1;
    v: String?;
}

contract NestStructs {
    data: S2;

    init() {
        self.data = S2{ x: S1{ a: 5, b: true }, v: null };
    }
}