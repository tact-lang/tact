struct WithOptionalDefault {
    msg: String;
    num: Int? = 12345;
}

contract OptionalDefaultStruct {
    val: WithOptionalDefault = WithOptionalDefault{
        msg: "test",
    };
}