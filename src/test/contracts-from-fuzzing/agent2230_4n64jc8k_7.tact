struct StructA { a: Int; b: Bool?; }
struct StructB { x: String?; y: StructA?; z: Int?; }

contract OptionalNestedContract {
    data: StructB;

    init() {
        self.data = StructB{
            x: null,
            y: StructA{ a: 5, b: null },
            z: 42
        };
    }
}