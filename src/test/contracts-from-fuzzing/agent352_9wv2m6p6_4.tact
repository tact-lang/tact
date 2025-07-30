struct Sub {
    x: Int = 1;
    y: Bool = false;
}

contract Test {
    val: Sub;

    init() {
        self.val = Sub{};
    }
}