struct SDef {
    x: Int = 1;
}

contract StructDefInit {
    s: SDef;
    init() {
        self.s = SDef{};
        self.s = SDef{ x: 5 };
    }
}