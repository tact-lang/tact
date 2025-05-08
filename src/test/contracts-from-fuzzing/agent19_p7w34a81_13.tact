struct W {
    a: Int?;
}

struct X {
    w: W;
    b: String?;
}

struct Y {
    x: X;
    c: Bool?;
}

struct Z {
    y: Y;
    d: Int;
}

contract DeepOptionalsContract {
    state: Z;

    init() {
        self.state = Z{
            y: Y{
                x: X{
                    w: W{ a: null },
                    b: "str",
                },
                c: null,
            },
            d: 123,
        };
    }
}