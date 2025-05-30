struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: Int?;
    d: String = "hello";
}

contract Test {
    val: DefaultVals;

    init() {
        self.val = DefaultVals{};
    }
}