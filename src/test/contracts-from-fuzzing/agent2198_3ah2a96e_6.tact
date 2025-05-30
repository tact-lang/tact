struct NestedOptional {
    opt_str: String?;
    opt_bool: Bool?;
}

struct Container {
    val: Int;
    nested_opt: NestedOptional?;
}

contract OptionalNestedStruct {
    data: Container;
    init() {
        self.data = Container{
            val: 99,
            nested_opt: NestedOptional{opt_str: "x", opt_bool: false},
        };
    }
}