struct X { x: Int }

struct Y { y: Int }

struct Z {
    a: X;
    b: Y;
    c: X?;
    d: Y?;
}

contract MixOptStructs {
    v: Z;

    init() {
        self.v = Z{
            a: X{ x: 1 },
            b: Y{ y: 2 },
            c: null,
            d: null
        };
    }
}