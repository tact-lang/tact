struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract BoolFields {
    f1: Bool;
    f2: Bool;
    mul: MultiBool;

    init() {
        self.f1 = true;
        self.f2 = false;
        self.mul = MultiBool {
            a: false,
            b: true,
            c: false,
        };
    }
}