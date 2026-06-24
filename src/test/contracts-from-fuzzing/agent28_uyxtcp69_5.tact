struct DeepInner {
    q: Int?;
    r: Bool?;
    s: String?;
}

struct DeepOuter {
    nested: DeepInner?;
    label: String;
}

contract DeeplyNestedOpt {
    data: DeepOuter;

    init() {
        self.data = DeepOuter{
            nested: DeepInner{ q: 10, r: true, s: null },
            label: "Label",
        };
    }
}