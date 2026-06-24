struct Weird {
    tiny: Int as uint4;
    mid: Int as int64;
    big: Int;
}

contract TestContract {
    w: Weird;

    init() {
        self.w = Weird{ tiny: 7, mid: 123456789, big: 9999999999999 };
    }
}
