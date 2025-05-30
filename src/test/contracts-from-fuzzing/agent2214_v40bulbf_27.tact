struct X { a: Int; b: Bool; c: String; }

contract MultiOptional {
    a: X?;
    b: X?;
    c: X?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}