struct NestedOpt {
    foo: Int?;
    bar: Bool;
}

contract TestContract {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{
            foo: null,
            bar: true,
        };
    }
}