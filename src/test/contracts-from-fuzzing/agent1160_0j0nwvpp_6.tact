struct InnerOptional {
    a: Int?;
    b: Bool?;
    s: String?;
}

struct OuterStruct {
    inner: InnerOptional?;
    count: Int;
}

contract OptionalInStruct {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: null,
            count: 0
        };
    }
}