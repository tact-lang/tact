struct NestedOpt {
    a: Int?;
    b: String?;
}

struct OuterStruct {
    inner: NestedOpt;
    flag: Bool;
}

contract OptionalNested {
    val: OuterStruct = OuterStruct{
        inner: NestedOpt{ a: null, b: null },
        flag: true,
    };
}
