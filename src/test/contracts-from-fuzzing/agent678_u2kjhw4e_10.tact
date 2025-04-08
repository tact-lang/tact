struct MixedStruct {
    intField: Int;
    optBool: Bool?;
    strField: String;
    optString: String?;
    addrField: Address;
}

contract TestContract {
    val: MixedStruct;
    init() {
        self.val = MixedStruct{
            intField: -5,
            optBool: null,
            strField: "test",
            optString: null,
            addrField: myAddress()
        };
    }
}