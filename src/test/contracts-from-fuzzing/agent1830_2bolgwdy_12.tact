struct BoolDefaults {
    b1: Bool = true;
    b2: Bool = false;
}

contract TestContract {
    data: BoolDefaults;

    init() {
        self.data = BoolDefaults{
            b1: true,
            b2: false
        };
    }
}
