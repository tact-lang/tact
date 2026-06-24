// Struct with many primitive + optional fields, inside contract param
struct LargeOptStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool;
    i: String?;
    j: Int?;
}

contract ParamLargeStruct(
    field: LargeOptStruct
) {
    receive() {}
}