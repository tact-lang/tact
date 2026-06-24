struct S1 { a: Int; b: String }
struct S2 { c: Int?; d: Bool }

struct Combined {
    s1: S1?;
    s2: S2?;
}

contract TestContract {
    f: Combined;

    init() {
        self.f = Combined{
            s1: S1{ a: 0, b: "" },
            s2: null,
        };
    }
}