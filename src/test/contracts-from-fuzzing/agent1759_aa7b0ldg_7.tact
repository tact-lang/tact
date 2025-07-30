struct DeepOptional {
    foo: Int?;
    nested1: NestedOpt1?;
}

struct NestedOpt1 {
    bar: String?;
    nested2: NestedOpt2?;
}

struct NestedOpt2 {
    baz: Address?;
    nested3: NestedOpt3?;
}

struct NestedOpt3 {
    qux: Bool?;
    leaf: Int?;
}

contract TestContract {
    val: DeepOptional;

    init() {
        self.val = DeepOptional{
            foo: null,
            nested1: null
        };
    }

    receive() {}
}