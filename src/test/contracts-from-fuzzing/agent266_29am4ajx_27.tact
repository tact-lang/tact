struct IntBooleans {
    i: Int;
    b1: Bool;
    b2: Bool;
}

contract IntBoolMix {
    data: IntBooleans;

    init() {
        self.data = IntBooleans{
            i: 100,
            b1: true,
            b2: false
        };
    }
}