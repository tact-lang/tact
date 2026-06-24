struct Wrap {
    x: Int;
}

contract OptionalPersistentWrap {
    wrapOpt: Wrap?;

    init() {
        self.wrapOpt = null;
    }
}