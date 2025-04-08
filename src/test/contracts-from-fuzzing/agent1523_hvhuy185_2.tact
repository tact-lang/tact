contract TestContract {
    booleanFlag: Bool;
    smallInt: Int as uint4;
    negativeInt: Int;
    bigUnsigned: Int as uint256;
    fixedTrue: Bool = true;
    fixedFalse: Bool = false;

    init() {
        self.booleanFlag = false;
        self.smallInt = 12;
        self.negativeInt = -500;
        self.bigUnsigned = 999999999;
        self.fixedTrue = true;
        self.fixedFalse = false;
    }
}