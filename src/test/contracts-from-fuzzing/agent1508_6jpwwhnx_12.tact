struct DefaultVals {
    x: Int = 7;
    y: Bool = true;
    s: String = "abc";
}

contract TestContract {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}