// Nested optional struct assigned null (should be fine)
struct MyStruct {
    x: Int;
}

contract ContractHasOptionalStruct {
    foo: MyStruct?;

    init() {
        self.foo = null;
    }
}