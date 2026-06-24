struct Inner {
    f: Int;
    s: String?;
}

struct Outer {
    nested: Inner;
    label: String;
}

contract TestContract {
    optOuter: Outer?;

    init() {
        self.optOuter = Outer{
            nested: Inner{
                f: 55,
                s: null,
            },
            label: "wrap",
        };
    }
}