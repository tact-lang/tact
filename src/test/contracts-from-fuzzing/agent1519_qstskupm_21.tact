struct MaxInts {
    a: Int as int257;
    b: Int as uint256;
    c: Int;
}

contract MaxIntWidths {
    state: MaxInts = MaxInts{a:1, b:2, c:3};

    init() {
        self.state = MaxInts{a:-1, b:255, c:0};
    }
}