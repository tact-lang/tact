struct Booleans {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract BoolVars {
    f: Booleans;

    init() {
        self.f = Booleans{
            a: true,
            b: false,
            c: true
        };
    }
}