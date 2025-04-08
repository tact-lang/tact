struct NestedOptStruct {
    nested: InnerOptionals;
    flag: Bool;
}

struct InnerOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract Test16 {
    s: NestedOptStruct = NestedOptStruct{
        nested: InnerOptionals{ x: null, y: null, z: null },
        flag: true
    };
    init() {}
}
