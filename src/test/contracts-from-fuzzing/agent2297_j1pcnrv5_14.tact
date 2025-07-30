struct Dual {
    first: Int;
    second: Int;
}

contract Test {
    opt1: Dual?;
    opt2: Dual?;

    init() {
        self.opt1 = null;
        self.opt2 = Dual{first: 1, second:2};
    }
}