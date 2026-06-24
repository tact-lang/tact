struct Wrap {
    addr: Address;
}

contract OptionalWrap {
    wrapOpt: Wrap?;

    init() {
        self.wrapOpt = null;
    }
}