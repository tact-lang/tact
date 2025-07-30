struct Deep {
    b1: Bool;
    val1: Int as uint2;
    b2: Bool;
    val2: Int as uint6;
    optVal: Int?;
    b3: Bool;
}

contract TestContract {
    data: Deep;

    init() {
        self.data = Deep{
            b1: true,
            val1: 3,
            b2: false,
            val2: 50,
            optVal: null,
            b3: true
        };
    }
}