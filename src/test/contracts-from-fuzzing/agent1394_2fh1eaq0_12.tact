struct HasBool {
    flag: Bool;
}

contract Toggle {
    state: HasBool;

    init() {
        self.state = HasBool{ flag: false };
    }
}