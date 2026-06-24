struct Defaulted {
    x: Int = 123;
    y: Bool = true;
    s: String = "def";
}

contract Test6 {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}