struct BoolInts {
    b1: Bool;
    i1: Int;
    b2: Bool;
    i2: Int;
    b3: Bool;
    i3: Int;
    b4: Bool;
    i4: Int;
}

contract AlternatingTest {
    data: BoolInts;

    init() {
        self.data = BoolInts{
            b1: true,
            i1: 1,
            b2: false,
            i2: 2,
            b3: true,
            i3: 3,
            b4: false,
            i4: 4
        };
    }
}