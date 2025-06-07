struct InnerOptional {
    value: Int?;
    comment: String;
}

struct TopStruct {
    nested: InnerOptional?;
}

contract OptionalNested {
    storage: TopStruct;

    init() {
        self.storage = TopStruct{
            nested: null
        };
    }
}