struct WrappedBool {
    flag: Bool;
}

contract BoolStructStorage {
    data: WrappedBool;
    init() {
        self.data = WrappedBool{ flag: true };
    }
}