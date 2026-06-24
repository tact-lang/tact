struct InnerMost {
    field: Int;
}

struct Middle {
    a: Int;
    inner: InnerMost;
}

struct Outer {
    prefix: Int;
    core: Middle;
    suffix: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            prefix: 1,
            core: Middle{
                a: 2,
                inner: InnerMost{field:3}
            },
            suffix: 4
        };
    }
}