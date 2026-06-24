struct OptionStruct {
    foo: Int?;
    bar: Bool?;
    nested: Nested?;
}

struct Nested {
    val: Int;
}

contract TestContract {
    data: OptionStruct;
    init() {
        self.data = OptionStruct {
            foo: 10,
            bar: null,
            nested: Nested { val: 99 }
        };
    }
}