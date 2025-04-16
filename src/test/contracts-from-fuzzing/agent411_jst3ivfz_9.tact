struct NestedBool {
    flag1: Bool;
    flag2: Bool;
}

contract NestedBoolContract {
    outerFlag: Bool;
    nestedStruct: NestedBool;

    init() {
        self.outerFlag = true;
        self.nestedStruct = NestedBool{
            flag1: false,
            flag2: true
        };
    }
}