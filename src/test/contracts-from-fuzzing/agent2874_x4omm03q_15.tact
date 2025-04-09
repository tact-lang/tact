struct DeepStruct {
    foo: Int? as int32;
    bar: Bool;
}

struct MidStruct {
    deep: DeepStruct;
    str: String?;
}

struct TopStruct {
    mid: MidStruct;
    n: Int as uint8;
}

contract TestContract {
    nested: TopStruct;

    init() {
        self.nested = TopStruct{
            mid: MidStruct{
                deep: DeepStruct{foo: null, bar: true},
                str: "hi"
            },
            n: 123
        };
    }
}
