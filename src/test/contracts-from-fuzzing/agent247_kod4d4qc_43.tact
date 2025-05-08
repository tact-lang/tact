struct StructA {
    a: Int;
}
struct StructB {
    b: StructA;
}
contract Composition {
    f: StructB;
    init() {
        self.f = StructB{ b: StructA{ a: 777 } };
    }
}