struct OptInner {
    foo: Int?;
    bar: Bool?;
}

contract OptionalNested {
    val: OptInner?;

    init() {
        self.val = OptInner{foo: 42, bar: null};
    }
}