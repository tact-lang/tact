struct NestedLevel2 {
    a: Int;
    b: Bool;
}

struct NestedLevel1 {
    c: NestedLevel2;
    d: String?;
}

struct RootStruct {
    e: NestedLevel1;
}

contract DeepContract {
    field: RootStruct = RootStruct{
        e: NestedLevel1{
            c: NestedLevel2{
                a: 42,
                b: false,
            },
            d: null,
        },
    };
}