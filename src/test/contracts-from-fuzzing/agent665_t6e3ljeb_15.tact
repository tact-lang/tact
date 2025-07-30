struct HasString {
    str: String;
    strOpt: String?;
}

struct HasBool {
    b: Bool;
    bOpt: Bool?;
}

contract StructFieldsCombo {
    s: HasString;
    b: HasBool;

    init() {
        self.s = HasString{ str: "hi", strOpt: null };
        self.b = HasBool{ b: true, bOpt: null };
    }
}
