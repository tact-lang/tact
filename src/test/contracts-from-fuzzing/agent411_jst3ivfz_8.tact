struct Tiny {
    bit: Bool;
}

contract BoolPackingTest {
    a: Bool;
    b: Bool;
    c: Bool;
    nested: Tiny;

    init() {
        self.a = true;
        self.b = false;
        self.c = true;
        self.nested = Tiny{ bit: false };
    }
}