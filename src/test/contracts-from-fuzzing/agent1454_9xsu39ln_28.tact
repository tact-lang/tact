struct Reversed {
    b: Int as uint256;
    a: Int as uint4;
}

contract ReverseOrder {
    data: Reversed;

    init() {
        self.data = Reversed{ b: 123456789, a: 15 };
    }
}