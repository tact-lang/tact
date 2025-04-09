struct InnerMost {
    foo: Int;
}

struct Middle {
    bar: InnerMost;
}

struct Outer {
    baz: Middle;
}

contract NestedLayers {
    content: Outer;
    init() {
        self.content = Outer{
            baz: Middle{
                bar: InnerMost{
                    foo: 777
                }
            }
        };
    }
}