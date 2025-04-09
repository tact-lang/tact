struct Reordered {
    one: Int as uint8;
    two: Int;
    three: Int as uint4;
    four: Int;
}

contract Test {
    data: Reordered;

    init() {
        self.data = Reordered{
            one: 1,
            two: 2,
            three: 3,
            four: 4
        };
    }
}