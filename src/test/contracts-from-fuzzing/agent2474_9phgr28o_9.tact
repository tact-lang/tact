struct ExtraInfo {
    tag: String;
    count: Int;
}

contract OptionalNestedOverwrite {
    info: ExtraInfo? = null;

    init() {
        self.info = ExtraInfo{
            tag: "initialized",
            count: 5,
        };
    }
}
