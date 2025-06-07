struct WithHugeString {
    longStr: String;
}

contract TestContract {
    s: WithHugeString;

    init() {
        self.s = WithHugeString{ longStr: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()" };
    }
}