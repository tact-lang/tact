struct InnerMost {
    deepField: Int;
}

struct Inner {
    maybeDeep: InnerMost?;
    flag: Bool;
}

struct Outer {
    innerData: Inner;
    label: String;
}

contract DeepNesting {
    state: Outer;

    init() {
        self.state = Outer{
            innerData: Inner{
                maybeDeep: null,
                flag: false
            },
            label: "test"
        };
    }
}