struct X { a: Int; }
struct Y { b: Int?; }
struct Z { x: X; y: Y; }

contract TestContract {
    z: Z;

    init() {
        self.z = Z{
            x: X{ a: 7 },
            y: Y{ b: null },
        };
    }
}