struct OptionalDeep {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

struct OuterWithInnerOpt {
    id: Int;
    inner: OptionalDeep?;
    description: String;
}

contract OptionalInnerStruct {
    item: OuterWithInnerOpt;

    init() {
        self.item = OuterWithInnerOpt{
            id: 808,
            inner: null,
            description: "desc",
        };
    }
}