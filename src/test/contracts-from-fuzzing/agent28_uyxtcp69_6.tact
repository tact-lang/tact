struct DeepInner {
    q: Int?;
    r: Bool?;
    s: String?;
}

struct DeepOuter {
    nested: DeepInner?;
    label: String;
}

contract NullNestedOpt {
    data: DeepOuter;

    init() {
        self.data = DeepOuter{
            nested: null,
            label: "Empty",
        };
    }
}