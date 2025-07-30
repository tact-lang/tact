struct MyStruct {
    a: Int;
    b: Bool;
    c: String;
}

struct MyOuter {
    s: MyStruct;
    d: Int;
    e: Bool;
}

contract NestedWithDefaults {
    field: MyOuter;

    init() {
        self.field = MyOuter{
            s: MyStruct{
                a: 0,
                b: false,
                c: "",
            },
            d: 1,
            e: true,
        };
    }
}