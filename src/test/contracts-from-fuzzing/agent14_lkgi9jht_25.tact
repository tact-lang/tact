struct MyStruct {
    field1: Int;
    field2: Bool;
    field3: String;
    nested: AnotherStruct;
}

struct AnotherStruct {
    a: Int;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s: MyStruct;

    init() {
        self.s = MyStruct{
            field1: 1,
            field2: true,
            field3: "s",
            nested: AnotherStruct{ a: 1, b: null, c: null }
        };
    }
}