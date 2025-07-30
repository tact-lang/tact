struct Inner {
    innerVal: Int;
    flag: Bool;
    note: String;
}

contract NestedContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            innerVal: 42,
            flag: true,
            note: "deep",
        };
    }
}