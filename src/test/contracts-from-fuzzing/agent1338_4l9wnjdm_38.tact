struct Wrap {
    a: Int;
}

contract OptionalWrap {
    optWrap: Wrap?;

    init() {
        self.optWrap = null;
    }
}