struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool?;
    nested: DeepOptional?;
}

struct DeepOptional {
    val: String?;
}

contract TestContract {
    state: NestedOptionalStruct;

    init() {
        self.state = NestedOptionalStruct {
            foo: null,
            bar: null,
            nested: DeepOptional { val: null }
        };
    }
}