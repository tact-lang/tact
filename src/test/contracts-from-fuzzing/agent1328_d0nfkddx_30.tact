struct Chain3 {
    a: Int;
    b: Bool;
}

contract EdgeFields {
    f1: Chain3;
    f2: Chain3?;

    init() {
        self.f1 = Chain3{ a:1, b:false };
        self.f2 = null;
    }
}