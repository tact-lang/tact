struct Inner {
    intValue: Int;
    boolValue: Bool;
    stringValue: String;
    addressValue: Address;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
}

contract MultiOptionalTest {
    storage: Inner;

    init() {
        self.storage = Inner{
            intValue: 42,
            boolValue: true,
            stringValue: "test",
            addressValue: myAddress(),
            optInt: null,
            optBool: null,
            optString: null,
            optAddress: null,
        };
    }
}