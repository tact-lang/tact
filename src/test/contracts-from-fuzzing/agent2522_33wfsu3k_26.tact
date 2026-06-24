struct SingleOpt {
    v: Int?;
}

contract TestContract {
    s: SingleOpt?;

    init() {
        self.s = null;
    }
}