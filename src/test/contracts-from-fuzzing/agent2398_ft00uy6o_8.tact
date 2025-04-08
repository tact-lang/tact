struct X {
    a: Int;
    b: Y;
}

struct Y {
    c: Int;
    d: Z;
}

struct Z {
    e: Int;
    f: String;
}

contract TestContract {
    s: X;

    init() {
        self.s = X{
            a: 1,
            b: Y{
                c: 2,
                d: Z{
                    e: 3,
                    f: "hello"
                }
            }
        };
    }
}