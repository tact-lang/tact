struct Z {
    foo: Int?;
}

struct Y {
    z: Z?;
    val: Int;
}

struct X {
    y: Y;
}

contract Test {
    nested: X;

    init() {
        self.nested = X{
            y: Y{
                z: null,
                val:42
            }
        };
    }
}