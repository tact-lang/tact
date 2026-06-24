struct Flat {
    a: Int;
    b: Int;
}

contract DirectFlat {
    x: Int;
    y: Bool;
    f: Flat;

    init() {
        self.x = 1;
        self.y = false;
        self.f = Flat{ a:5, b:6 };
    }
}
