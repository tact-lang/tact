struct HasOptional {
    x: Int?;
    y: String?;
}

struct NestedOpt {
    inner: HasOptional;
    flag: Bool;
}

contract OptionInNested {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: HasOptional{ x: null, y: null },
            flag: true
        };
    }
}
