struct X {
    a: Int?;
}
struct Y {
    b: Bool?;
}
struct Z {
    x: X;
    y: Y;
}

contract Test46 {
    z: Z;

    init() {
        self.z = Z{
            x: X{ a: null },
            y: Y{ b: true }
        };
    }
}
