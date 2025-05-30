struct Inner {
    value: Int;
}

struct Middle {
    nested: Inner;
}

struct Outer {
    deeper: Middle;
}

contract ThreeDeepNested {
    deep: Outer;

    init() {
        self.deep = Outer{
            deeper: Middle{
                nested: Inner{
                    value: 42,
                },
            },
        };
    }

    receive() {
        self.deep = Outer{
            deeper: Middle{
                nested: Inner{
                    value: self.deep.deeper.nested.value + 1,
                },
            },
        };
    }
}