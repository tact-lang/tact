struct StructA { x: Int; y: Bool; }
struct StructB { a: StructA; b: StructA; c: StructA; }

contract StructOfStructs {
    value: StructB;
    init() {
        self.value = StructB{
            a: StructA{ x: 1, y: true },
            b: StructA{ x: 2, y: false },
            c: StructA{ x: 3, y: true }
        };
    }
}