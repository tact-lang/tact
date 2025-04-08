trait OptionTrait {
    optInt: Int?;
    optBool: Bool?;
}

contract TraitOptionalVals with OptionTrait {
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optInt = null;
        self.optBool = true;
    }
    receive() {
        if (self.optInt != null) {
            let _ = self.optInt!!;
        }
    }
}