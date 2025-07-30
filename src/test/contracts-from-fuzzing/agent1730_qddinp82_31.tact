struct Wrap {
    val: Int;
}

contract TwoOptFields {
    opt1: Wrap?;
    opt2: Wrap?;

    init() {
        self.opt1 = Wrap{ val: 3 };
        self.opt2 = null;
    }
}