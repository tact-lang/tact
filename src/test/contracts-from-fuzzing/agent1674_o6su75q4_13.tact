message(42) Notice {
    msg: String;
    code: Int;
}

contract OptionalMessageField {
    latest: Notice?;

    init() {
        self.latest = null;
    }
}