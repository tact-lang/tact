struct Params {
    x: Int;
}

contract TwoStructs {
    first: Params = Params{ x: 1 };
    second: Params;

    init() {
        self.second = Params{ x: 2 };
    }

    receive() {}
}