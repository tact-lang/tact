struct SOptBool {
    a: Bool?;
}

contract OptionalBoolStorage {
    data: SOptBool;

    init() {
        self.data = SOptBool{};
    }

    receive() {
        let _ = self.data;
    }
}