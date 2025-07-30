struct MixStruct {
    plainInt: Int;
    flag: Bool;
    maybeText: String?;
    bigNum: Int;
    maybeFlag: Bool?;
}

contract MixOptContract {
    mixed: MixStruct;

    init() {
        self.mixed = MixStruct{
            plainInt: 1,
            flag: true,
            maybeText: null,
            bigNum: 999999,
            maybeFlag: false
        };
    }
}