struct IntsSerialization {
    tiny: Int as uint3;
    small: Int as int8;
    medium: Int as uint64;
    big: Int;
}

contract TestContract {
    nums: IntsSerialization;
    init() {
        self.nums = IntsSerialization{
            tiny: 3,
            small: -8,
            medium: 123456,
            big: 9876543210
        };
    }
}