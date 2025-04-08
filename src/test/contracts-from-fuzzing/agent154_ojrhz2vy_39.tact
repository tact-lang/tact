struct Defaulted {
    a: Int = 7;
    b: Bool = true;
    c: String = "default";
}

contract DefaultStructInit {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}