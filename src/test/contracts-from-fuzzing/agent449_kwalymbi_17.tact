struct X {
    x1: Int;
    x2: Bool?;
}

struct Y {
    y1: String;
    y2: X?;
}

struct Z {
    z1: Int;
    z2: Y;
}

contract TestContract {
    zfield: Z;

    init() {
        self.zfield = Z{
            z1: 9,
            z2: Y{
                y1: "wow",
                y2: X{
                    x1: 4,
                    x2: null,
                },
            },
        };
    }
}
