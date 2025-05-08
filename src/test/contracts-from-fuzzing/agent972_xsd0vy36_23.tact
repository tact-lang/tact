struct X { a: Int; }
struct Y { b: Bool; }
struct Z { c: String; }

struct BigNest {
    x: X;
    y: Y;
    z: Z;
    optX: X?;
    optY: Y?;
    optZ: Z?;
}

contract ContainerStructs {
    storage: BigNest;

    init() {
        self.storage = BigNest{
            x: X{ a: 1 },
            y: Y{ b: true },
            z: Z{ c: "hi" },
            optX: null,
            optY: null,
            optZ: null,
        };
    }
}
