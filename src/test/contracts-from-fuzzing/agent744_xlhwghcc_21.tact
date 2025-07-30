struct W {
    a:Int;
}

struct X {
    b:W;
}

struct Y {
    c:X;
}

struct Z {
    d:Y;
}

contract TestContract {
    data:Z;

    init() {
        self.data = Z{
            d: Y{
                c: X{
                    b: W{
                        a:123
                    }
                }
            }
        };
    }
}