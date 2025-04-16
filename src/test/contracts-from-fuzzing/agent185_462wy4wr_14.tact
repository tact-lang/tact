struct Top {
    a: Int;
    nested: Inner;
}

struct Inner {
    b: Int;
    innerNested: Deeper;
}

struct Deeper {
    c: Int;
}

contract DeepChain {
    data: Top;

    init() {
        self.data = Top{
            a: 1,
            nested: Inner{
                b: 2,
                innerNested: Deeper{ c: 3 }
            }
        };
    }
}