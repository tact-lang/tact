struct SmallInts {
    x: Int as uint4;
    y: Int as uint8;
}

contract NestedSmall {
    nums: SmallInts;

    init() {
        self.nums = SmallInts{ x: 7, y: 200 };
    }
}