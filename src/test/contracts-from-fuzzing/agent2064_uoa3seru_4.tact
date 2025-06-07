struct OptStruct {
    val: Int?;
    flag: Bool?;
    note: String?;
}

contract OptionalHolder {
    data: OptStruct = OptStruct{
        val: null,
        flag: null,
        note: null,
    };
}
