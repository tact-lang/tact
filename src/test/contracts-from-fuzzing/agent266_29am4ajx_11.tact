struct OptionalInOptional {
    foo: Int?;
    bar: Bool?;
}

struct TopStruct {
    nested: OptionalInOptional?;
    flag: Bool;
}

contract OptionalOfStructOptional {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            nested: null,
            flag: true
        };
    }
}