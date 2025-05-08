struct S1 {
    a: Int;
}

struct S2 {
    b: String;
}

struct Combine {
    x: S1;
    y: S2;
}

contract TestContract {
    f: Combine;

    init() {
        self.f = Combine{
            x: S1{ a: 11 },
            y: S2{ b: "hi" },
        };
    }
}