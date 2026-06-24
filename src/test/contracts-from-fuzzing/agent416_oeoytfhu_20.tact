struct X { x: Int }
struct Y { y: Int }
struct Z {
    xPart: X;
    yPart: Y;
}

contract Test20 {
    z: Z;

    init() {
        self.z = Z{
            xPart: X{ x: 5 },
            yPart: Y{ y: 10 },
        };
    }
}
