struct DefaultBool {
    b1: Bool = true;
    b2: Bool = false;
}

contract Test {
    data: DefaultBool;
    init() {
        self.data = DefaultBool{};
    }
}