struct Wrapper {
    n: Int;
}

contract OptionalWrapper {
    w: Wrapper?;

    init() {
        self.w = null;
    }
}
