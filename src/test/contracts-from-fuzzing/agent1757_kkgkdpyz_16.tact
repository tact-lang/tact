struct StructA {
    x: Int;
    y: Int;
}

contract StructFieldDefaults {
    a: StructA = StructA{ x: 1, y: 2 };

    init() {
        self.a = StructA{ x: 3, y: 4 };
    }
}