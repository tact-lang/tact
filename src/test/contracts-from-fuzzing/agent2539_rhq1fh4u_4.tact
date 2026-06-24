struct Small {
    val: Int;
}

contract OptionalNested {
    nestedOpt: Small?;

    init() {
        self.nestedOpt = Small{val: 123};
    }
}