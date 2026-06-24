struct Wild {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    addr: Address;
    optAddr: Address?;
}

contract WildFields {
    val: Wild = Wild{
        intVal: 42,
        boolVal: true,
        stringVal: "wild",
        optInt: null,
        optBool: null,
        optString: null,
        addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        optAddr: null
    };

    init() {}
}