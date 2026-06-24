struct HasBool {
    flag: Bool;
}

contract BoolStructStorage {
    s: HasBool;

    init() {
        self.s = HasBool{ flag: true };
    }
}