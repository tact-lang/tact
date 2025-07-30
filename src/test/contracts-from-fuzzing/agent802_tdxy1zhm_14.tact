struct StructX { a: Int; b: Int; }
struct StructY { c: Int; d: Int; }

contract MultiStruct {
    s1: StructX;
    s2: StructY;

    init() {
        self.s1 = StructX{ a:1, b:2 };
        self.s2 = StructY{ c:3, d:4 };
    }
}