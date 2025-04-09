struct SDefault {
    x: Int = 1;
    y: Bool = false;
}

contract Defaults {
    data: SDefault;

    init() {
        self.data = SDefault{};
    }
}