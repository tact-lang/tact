struct StructA { x: Int }
struct StructB { a: StructA }

contract NestedAssign {
    d: StructB;

    init() {
        self.d = StructB{ a: StructA{ x: 5 } };
    }

    receive() {
        self.d.a.x = 100;
    }
}
