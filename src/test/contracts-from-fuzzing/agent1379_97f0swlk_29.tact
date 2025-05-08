struct W {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
}

struct X {
    w: W;
}

struct Y {
    x: X;
}

struct Z {
    y: Y;
}

contract Wrapped {
    z: Z;

    init() {
        self.z = Z{
            y: Y{
                x: X{
                    w: W{
                        a: 42,
                        b: true,
                        c: "hello",
                        d: emptyCell().asSlice()
                    }
                }
            }
        };
    }
}
