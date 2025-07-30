struct BoolFirst {
    f1: Bool;
    f2: Int;
    f3: Bool;
    f4: Int;
}

contract TestContract {
    state: BoolFirst;

    init() {
        self.state = BoolFirst{
            f1: true,
            f2: 1,
            f3: false,
            f4: 2
        };
    }
}