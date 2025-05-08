struct OStruct {
    val: Int = 7;
    flag: Bool = true;
}

contract OptionalPersStruct {
    data: OStruct?;
    receive() {}
}