struct OptionalStruct {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract OptionalFieldsContract {
    optStruct: OptionalStruct = OptionalStruct {
        intOpt: null,
        boolOpt: null,
        stringOpt: null,
    };

    receive() {}
}