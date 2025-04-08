struct X {
    flag: Bool;
}

struct Y {
    nested: X;
}

struct Z {
    deep: Y;
}

contract PlentyDepth {
    z: Z;

    init() {
        self.z = Z{
            deep: Y{
                nested: X{ flag: true }
            }
        };
    }
}