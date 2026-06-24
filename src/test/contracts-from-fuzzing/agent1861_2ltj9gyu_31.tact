struct InnerMost { x: Int; }
struct Inner2 { nest: InnerMost; }
struct Inner3 { nest: Inner2; }
struct Outer {
    inner: Inner3;
    y: Int;
}

contract NestedMixed {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner3{
                nest: Inner2{
                    nest: InnerMost{
                        x: 77
                    }
                }
            },
            y: 88
        };
    }
}