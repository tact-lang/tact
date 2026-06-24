struct Data {
    x: Int;
    y: Int;
}

contract SwapFields {
    first: Data;
    second: Data;

    init() {
        self.first = Data{ x:1, y:2 };
        self.second = Data{ x:3, y:4 };
    }
}
