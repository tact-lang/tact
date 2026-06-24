struct SerInts {
    a: Int as uint32;
    b: Int as int64;
    c: Int;
}

contract TestContract {
    nums: SerInts;

    init() {
        self.nums = SerInts{
            a: 123,
            b: -456,
            c: 789
        };
    }
}