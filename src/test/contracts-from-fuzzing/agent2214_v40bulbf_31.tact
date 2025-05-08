struct X {
    value: Int;
}

struct Y {
    contents: X?;
}

struct Z {
    nested: Y?;
}

contract NullChain {
    field: Z;
    init() {
        self.field = Z{
            nested: null
        };
    }
}