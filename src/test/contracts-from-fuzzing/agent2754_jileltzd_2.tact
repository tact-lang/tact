struct Inner {
    optField: Address?;
}

contract OptionalTest {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = null;
    }
}
