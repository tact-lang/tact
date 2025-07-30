struct SX { a: Int; }
struct SY { b: SX; }

contract StructsSwapTest {
    foo: SY;

    init() {
        self.foo = SY{ b: SX{ a: 7 } };
    }
}
