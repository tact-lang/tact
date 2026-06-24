struct DefVals {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract Test11 {
    val: DefVals;

    init() {
        self.val = DefVals{};
    }
}