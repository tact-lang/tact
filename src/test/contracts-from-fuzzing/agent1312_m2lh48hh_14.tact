struct SerializeMix {
    small: Int as uint4;
    big: Int as uint256;
}

contract TestContract {
    s: SerializeMix;

    init() {
        self.s = SerializeMix{small: 15, big: 123456789};
    }
}