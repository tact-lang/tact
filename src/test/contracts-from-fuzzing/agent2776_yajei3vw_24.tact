struct NullableBool {
    flag: Bool?;
}

contract NullableBoolContract {
    v: NullableBool;

    init() {
        self.v = NullableBool{ flag: null };
    }
}
