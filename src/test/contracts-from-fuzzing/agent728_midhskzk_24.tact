struct SomeData {
    txt: String?;
    bigNum: Int;
}

contract BigStringOpt {
    data: SomeData;

    init() {
        self.data = SomeData{
            txt: null,
            bigNum: -123456789012345678901234567890
        };
    }
}