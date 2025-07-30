struct OptionalStruct {
    foo: Inner?;
}

struct Inner {
    bar: Another?;
}

struct Another {
    baz: Int;
}

contract DeepNulls {
    value: OptionalStruct;

    init() {
        self.value = OptionalStruct{
            foo: null
        };
    }
}