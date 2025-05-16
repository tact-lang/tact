struct OptionalNest {
    nestedOpt: Int?;
    plain: Int;
}

contract OptionalInStruct {
    myVal: OptionalNest?;

    init() {
        self.myVal = null;
    }
}