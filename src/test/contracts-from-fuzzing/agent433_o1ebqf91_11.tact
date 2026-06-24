struct X { a: Int }
struct Y { b: Bool }
struct Z { c: Address }

struct Nested {
    x: X; y: Y; z: Z;
    optX: X?; optY: Y?; optZ: Z?;
}

contract TestContract {
    store: Nested;

    init() {
        self.store = Nested{
            x: X{ a: 1 },
            y: Y{ b: true },
            z: Z{ c: myAddress() },
            optX: null,
            optY: null,
            optZ: null
        };
    }
}