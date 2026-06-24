struct InnerMost {
    deepVal: Int = 77;
    optionalDeep: String?;
}

struct Middle {
    inner: InnerMost;
    name: String = "middle";
    enabled: Bool = true;
}

struct Top {
    mid: Middle;
    comment: String = "top";
}

contract DeepNest {
    bigField: Top;

    init() {
        self.bigField = Top{
            mid: Middle{
                inner: InnerMost{
                    deepVal: 99,
                    optionalDeep: "ok",
                },
                name: "midname",
                enabled: false,
            },
            comment: "done",
        };
    }
}
