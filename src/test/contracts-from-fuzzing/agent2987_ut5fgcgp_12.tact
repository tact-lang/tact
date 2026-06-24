struct StructA {
    x: Int;
}

struct StructB {
    a: StructA;
    y: Int;
}

struct StructC {
    b: StructB;
    z: Bool;
}

contract NestedComposite {
    data: StructC;

    init() {
        self.data = StructC {
            b: StructB {
                a: StructA { x: 7 },
                y: 8
            },
            z: true
        };
    }
}
