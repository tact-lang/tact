struct FlagData {
    flag1: Bool;
    flag2: Bool?;
    flag3: Bool;
    text: String;
    number: Int?;
}

contract FlagsContract {
    fd: FlagData;

    init() {
        self.fd = FlagData{
            flag1: true,
            flag2: null,
            flag3: false,
            text: "flags",
            number: null
        };
    }
}
