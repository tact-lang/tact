struct Ad {
    content: String;
    cost: Int;
}

contract OptionalStructDirect {
    current: Ad?;

    init() {
        self.current = null;
    }
}