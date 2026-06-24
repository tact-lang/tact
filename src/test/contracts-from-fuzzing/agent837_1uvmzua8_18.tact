struct StructX { x: Int; y: Int?; }

contract ArrangedOrder {
    a: Int;
    b: StructX;
    c: Bool?;
    d: String;
    e: Int;
    init() {
        self.a = 1;
        self.b = StructX{ x: 2, y: null };
        self.c = false;
        self.d = "foo";
        self.e = 5;
    }
}