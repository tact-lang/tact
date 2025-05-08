struct SOption {
    s: String?;
    b: Bool?;
}

contract OptionalInStruct {
    data: SOption;

    init() {
        self.data = SOption{
            s: null,
            b: true,
        };
    }
}