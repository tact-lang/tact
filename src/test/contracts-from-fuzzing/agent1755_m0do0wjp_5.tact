struct DeepPrimitives {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    stringField: String;

    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
    optString: String?;
}

contract TestContract {
    data: DeepPrimitives = DeepPrimitives{
        intField: 0,
        boolField: false,
        addressField: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        stringField: "hi",
        optInt: null,
        optBool: null,
        optAddress: null,
        optString: null
    };
}
