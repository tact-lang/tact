struct IntAsUintSmall {
    a: Int as uint8;
}

contract SerializationSmallUint {
    data: IntAsUintSmall;

    init() {
        self.data = IntAsUintSmall{a:255};
    }
}