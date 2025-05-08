struct SubStruct {
    a: Int;
    b: Bool?;
}

contract ParameterSubStruct(
    s: SubStruct,
) {
    receive() {}
}