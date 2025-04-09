struct Rec {
    num: Int;
    maybeTxt: String?;
}

contract OptionalsInStruct {
    r: Rec;

    init() {
        self.r = Rec{
            num:1,
            maybeTxt: null
        };
    }
}