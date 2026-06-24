struct SDefault {
    x: Int = 1;
    y: Bool = false;
}

contract DefaultsOnly {
    val: SDefault;

    init() {
        self.val = SDefault{};
    }
}