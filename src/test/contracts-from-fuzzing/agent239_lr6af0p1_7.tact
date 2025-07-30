struct Ints {
    a: Int;
    b: Int as int8;
    c: Int as uint4;
    d: Int as uint64;
}

contract SerializedIntsContract {
    nums: Ints;

    init() {
        self.nums = Ints{ a: 1, b: -5, c: 7, d: 123456789 };
    }
}