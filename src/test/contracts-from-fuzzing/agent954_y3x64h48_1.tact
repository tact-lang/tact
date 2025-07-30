struct NestedInner {
    flag: Bool;
    number: Int;
}

struct OuterStruct {
    inner: NestedInner;
    optVal: Int?;
    strVal: String;
    boolVal: Bool;
}

contract NestedTest {
    info: OuterStruct = OuterStruct{
        inner: NestedInner{flag: true, number: 7},
        optVal: null,
        strVal: "test",
        boolVal: false
    };

    init() {}
}