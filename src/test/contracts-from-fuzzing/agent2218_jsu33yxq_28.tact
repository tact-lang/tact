struct HasEmptyStrDefault {
    s: String = "";
}

contract Test {
    data: HasEmptyStrDefault;
    init() {
        self.data = HasEmptyStrDefault{};
    }
}