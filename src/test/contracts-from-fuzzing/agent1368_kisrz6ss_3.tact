struct OptionalStruct {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    os: OptionalStruct = OptionalStruct{val: null, flag: null};
    init() {}
    receive() {}
}