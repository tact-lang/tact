struct InnerDefault {
    x: Int = 7;
    y: Bool = false;
}

contract StructDefaults {
    val: InnerDefault = InnerDefault{};

    receive() {
        self.val = InnerDefault{ x: 10, y: true };
    }
}