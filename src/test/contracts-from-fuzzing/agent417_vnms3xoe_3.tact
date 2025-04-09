struct OptNestedInner {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    val: OptNestedInner;

    init() {
        self.val = OptNestedInner{
            foo: null,
            bar: true,
        };
    }
}