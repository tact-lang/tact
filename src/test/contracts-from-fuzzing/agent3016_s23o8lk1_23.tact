struct ZeroDefaults {
    x: Int = 0;
    y: Int = 0;
    b: Bool = false;
}

contract TestContract {
    d: ZeroDefaults;

    init() {
        self.d = ZeroDefaults{
            x: 1,
            y: 2,
            b: true
        };
    }
}