struct InnerMost {
    x: Int;
    y: Int;
}

struct Middle {
    inner: InnerMost;
    label: String;
}

struct OuterMost {
    middle: Middle;
    name: String;
}

contract TestContract {
    complex: OuterMost;
    init() {
        self.complex = OuterMost{
            middle: Middle{
                inner: InnerMost{
                    x: 1,
                    y: 2
                },
                label: "label"
            },
            name: "outer"
        };
    }
}