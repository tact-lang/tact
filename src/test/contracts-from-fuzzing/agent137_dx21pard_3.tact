struct TopLevel {
    foo: Int;
    nested: Inner;
}

struct Inner {
    bar: Bool;
    deep: Deeper;
}

struct Deeper {
    baz: String;
    flag: Bool;
}

contract DeepNesting {
    t: TopLevel;

    init() {
        self.t = TopLevel{
            foo: 1,
            nested: Inner{
                bar: true,
                deep: Deeper{
                    baz: "x",
                    flag: false
                }
            }
        };
    }
}
