struct Nested {
    value: Int = 1;
}

struct Wrapper {
    nested: Nested?; // optional nested struct
}

contract OptionalNestedStruct {
    field: Wrapper = Wrapper{nested: null};
}