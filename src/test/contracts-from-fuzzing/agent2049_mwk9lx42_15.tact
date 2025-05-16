struct Flat {
    a: Int;
    b: Int;
    c: Int;
}

contract Test {
    a: Int;
    b: Flat;
    c: Int;

    init() {
        self.a = 1;
        self.b = Flat{ a: 2, b: 3, c: 4 };
        self.c = 5;
    }
}