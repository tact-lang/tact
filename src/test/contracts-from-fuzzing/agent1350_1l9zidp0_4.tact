struct InnerMost {
    flag: Bool;
    count: Int;
}

struct Inner {
    core: InnerMost;
    name: String?;
}

contract Nested {
    data: Inner = Inner{
        core: InnerMost{ flag: true, count: 99 },
        name: null
    };

    init() {
        self.data = Inner{
            core: InnerMost{ flag: false, count: 123 },
            name: "deep"
        };
    }
}