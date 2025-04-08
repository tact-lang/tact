struct MixedInts {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as coins;
}

contract TestContract {
    nums: MixedInts;
    init() {
        self.nums = MixedInts{ a:1, b:2, c:3, d:4 };
    }
}