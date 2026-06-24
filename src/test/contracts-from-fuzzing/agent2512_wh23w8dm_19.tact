struct SDefault {
    x: Int = 3;
    y: Bool = false;
}

contract ReassignDefaults {
    val: SDefault;

    init() {
        self.val = SDefault{};
        self.val = SDefault{ x: 10, y: true };
    }
}