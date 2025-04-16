struct Ints {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
}

contract IntegersContract {
    val: Ints;

    init() {
        self.val = Ints{
            a: 1,
            b: 255,
            c: -1000
        };
    }
}