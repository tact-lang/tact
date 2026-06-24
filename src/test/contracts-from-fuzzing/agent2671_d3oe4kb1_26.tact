struct OneMore {
    big: Int as uint256;
    tiny: Int as int1;
}

contract BigTiny {
    stuff: OneMore;

    init() {
        self.stuff = OneMore{
            big: 12345678901234567890,
            tiny: 1
        };
    }
}