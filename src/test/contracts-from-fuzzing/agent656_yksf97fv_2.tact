struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: String?;
    i: Bool;
    j: Int;
}

contract ManyTypedFields(
    ls: LargeStruct,
    count: Int,
    enabled: Bool,
    optionalStr: String?,
    optInt: Int?,
    flag: Bool,
) {
}