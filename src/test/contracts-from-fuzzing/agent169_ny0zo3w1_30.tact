struct OptionsInside {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    oi: OptionsInside?;

    init() {
        self.oi = null;
    }
}