struct V {
    a: Int;
}

struct W {
    x: Int;
    y: V?;
}

struct X {
    nested: W;
}

contract OptionalDeep {
    data: X;

    init() {
        self.data = X{
            nested: W{
                x:42,
                y:null
            }
        };
    }
}
