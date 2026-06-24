contract OptionalOfStruct {
    s: MyStruct?;

    init() {
        self.s = null;
    }
}

struct MyStruct {
    foo: Int;
    bar: Bool?;
    nested: NestedStruct;
}

struct NestedStruct {
    val: Int;
}