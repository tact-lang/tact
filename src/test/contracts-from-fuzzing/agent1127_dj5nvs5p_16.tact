struct Mixed {
    i: Int;
    b: Bool;
    s: String;
}

contract ArrayOfStructs {
    f1: Mixed;
    f2: Mixed;
    f3: Mixed;

    init() {
        self.f1 = Mixed{ i: 1, b: true, s: "a" };
        self.f2 = Mixed{ i: 2, b: false, s: "b" };
        self.f3 = Mixed{ i: 3, b: true, s: "c" };
    }
}
