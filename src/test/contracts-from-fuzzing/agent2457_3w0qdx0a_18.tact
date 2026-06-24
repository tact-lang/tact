struct HasBool {
    flag: Bool;
}

struct HasOptionalStruct {
    inner: HasBool?;
    id: Int;
}

contract OptionalInnerStruct {
    data: HasOptionalStruct;

    init() {
        self.data = HasOptionalStruct{
            inner: null,
            id: 42
        };
    }
}