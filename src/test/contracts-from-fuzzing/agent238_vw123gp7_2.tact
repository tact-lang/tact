struct SingleBool {
    flag: Bool;
}

contract TestBool {
    data: SingleBool;

    init() {
        self.data = SingleBool{flag: true};
    }
}