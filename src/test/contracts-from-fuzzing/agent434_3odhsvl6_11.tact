struct BigStruct {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Int?;
    x5: Bool?;
    x6: String?;
}

contract NestedBigParam(
    nested: BigStruct
) {
    receive() {}
}
