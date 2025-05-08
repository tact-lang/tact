struct DeepStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    num: Int;
}

contract DeepNestedStorage {
    s: DeepStruct;

    init() {
        self.s = DeepStruct{
            inner: InnerStruct{
                flag: false,
                num: 123,
            },
        };
    }
}
