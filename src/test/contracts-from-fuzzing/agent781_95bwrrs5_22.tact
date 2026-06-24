struct HasDefault {
    x: Int = 1;
    y: Bool = true;
}

contract TestContract {
    d: HasDefault;

    init() {
        self.d = HasDefault{};
    }
}