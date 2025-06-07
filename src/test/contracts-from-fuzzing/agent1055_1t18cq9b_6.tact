struct Inner {
    info: String?;
    num: Int?;
}

struct OptionalMix {
    flag: Bool?;
    innerData: Inner?;
    count: Int;
}

contract OptionalDeepStruct {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            flag: null,
            innerData: null,
            count: 77,
        };
    }
}