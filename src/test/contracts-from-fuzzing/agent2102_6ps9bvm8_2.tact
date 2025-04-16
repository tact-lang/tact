struct InnerMost {
    a: Int?;
    b: Bool;
}

struct Inner {
    inside: InnerMost;
    flag: Bool?;
}

struct Outer {
    nested: Inner;
    done: Bool;
}

contract LayerCake {
    st: Outer;

    init() {
        self.st = Outer{
            nested: Inner{
                inside: InnerMost{
                    a: null,
                    b: true,
                },
                flag: null,
            },
            done: false,
        };
    }
}