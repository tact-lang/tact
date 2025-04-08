struct Z {
    val: Int;
}

struct Y {
    z: Z;
}

struct X {
    y: Y;
}

struct W {
    x: X;
}

contract TestContract {
    w: W;
    init() {
        self.w = W{
            x: X{
                y: Y{
                    z: Z{
                        val: 123,
                    },
                },
            },
        };
    }
}