struct OptionalNested {
    flag: Bool?;
    info: String?;
    inner: InnerOptional?;
}

struct InnerOptional {
    num: Int?;
    status: Bool?;
}

contract OptionalDeep {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            flag: null,
            info: null,
            inner: null
        };
    }
}