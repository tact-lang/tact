struct WrapDefault {
    value: Int = 5;
}

contract SetToDefaultAgain {
    s: WrapDefault;

    init() {
        self.s = WrapDefault{ value:5 };
    }
}