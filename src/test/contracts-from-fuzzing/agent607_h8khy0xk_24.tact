struct FlatOpt {
    foo: String?;
}

struct DeepOpt {
    inner: FlatOpt?;
}

contract NestedOptionals {
    val: DeepOpt?;

    init() {
        self.val = DeepOpt{ inner: FlatOpt{ foo: "bar" } };
    }
}