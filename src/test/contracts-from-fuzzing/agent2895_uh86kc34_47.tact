struct Deep {
    inner: String?;
}

contract OptionalStringDeep {
    s: Deep?;

    init() {
        self.s = null;
    }
}
