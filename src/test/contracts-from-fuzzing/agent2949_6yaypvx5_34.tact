struct StrLenEdge {
    shortStr: String = "a";
    longStr: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
}

contract LongShortStrings {
    data: StrLenEdge;

    init() {
        self.data = StrLenEdge{};
    }
}
