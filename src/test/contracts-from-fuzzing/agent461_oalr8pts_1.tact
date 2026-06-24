struct OnlyBool {
    flag: Bool;
}

contract Test {
    data: OnlyBool;
    init() {
        self.data = OnlyBool{flag: true};
    }
}