// assign struct with default optional fields only partially
struct S {
    a: Int?;
    b: Bool?;
}

contract C {
    s: S;
    init() {
        self.s = S{ a: null, b: null };
    }
}