struct WrapOpt {
    val: Int?;
}

contract TestContract {
    one: WrapOpt?;
    two: WrapOpt?;
    three: WrapOpt?;
    four: WrapOpt?;
    five: WrapOpt?;

    init() {
        self.one = null;
        self.two = null;
        self.three = null;
        self.four = null;
        self.five = null;
    }
}