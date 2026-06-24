struct X {
    a: Int;
}

struct Y {
    b: Int;
    c: X;
}

struct Z {
    d: Int;
    e: Y;
}

contract NestedChain {
    val: Z;
    init() {
        self.val = Z{
            d: 5,
            e: Y{
                b:6,
                c: X{a:7}
            }
        };
    }
}