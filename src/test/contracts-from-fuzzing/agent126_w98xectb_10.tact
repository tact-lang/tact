struct NestedOpt {
    inner: Bool?;
}

struct Mid {
    nested: NestedOpt;
    s: String;
}

contract DeepOpt {
    data: Mid?;

    init() {
        self.data = Mid{
            nested: NestedOpt{ inner: null },
            s: "hi"
        };
    }
}