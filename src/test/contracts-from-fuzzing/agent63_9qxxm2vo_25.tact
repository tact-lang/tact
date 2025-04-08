struct ComboFields {
    message: String;
    maybeNum: Int?;
    isSet: Bool;
    tiny: Int as uint4;
    maybeText: String?;
}

contract MultiCombo {
    val: ComboFields;

    init() {
        self.val = ComboFields{
            message:"start",
            maybeNum:null,
            isSet:true,
            tiny:7,
            maybeText:null
        };
    }
}