struct Z {
    p: Int = 33;
    q: Int = 44;
}

struct Y {
    z: Z?;              // optional, so default is null, no explicit needed
    r: Int = 22;
}

struct X {
    y: Y;
    s: Int = 11;
}

contract NestedSomeInnerOptional {
    val: X;

    init() {
        self.val = X{
            y: Y{},    // no explicit z field provided
            s: 99
        };
    }
}