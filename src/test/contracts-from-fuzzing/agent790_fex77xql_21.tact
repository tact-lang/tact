struct HasBool {
    flag: Bool;
}

contract BoolContract {
    val: HasBool;

    init() {
        self.val = HasBool{flag: true};
    }
}