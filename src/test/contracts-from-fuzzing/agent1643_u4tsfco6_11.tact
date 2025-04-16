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

contract CrossRefs {
    data: X;

    init() {
        self.data = X{
            a: 1,
            b: Y{
                c: 2,
                d: Z{ e: 3, f: "hi" }
            }
        };
    }
}