struct InnerMost {
    value: Int;
}

struct Inner {
    nested: InnerMost;
    flag: Bool;
}

struct Outer {
    data: Inner;
    extra: String;
}

contract TestContract {
    state: Outer;
    
    init() {
        self.state = Outer{
            data: Inner{
                nested: InnerMost{ value: 5 },
                flag: true,
            },
            extra: "hi",
        };
    }
}