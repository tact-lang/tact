struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract FullParams(
    one: LargeStruct,
    two: LargeStruct
) {}