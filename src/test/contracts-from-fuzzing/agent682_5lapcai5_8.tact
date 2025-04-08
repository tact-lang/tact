struct IntDefaults {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
}

contract TestContract {
    nums: IntDefaults;

    init() {
        self.nums = IntDefaults{};
    }
}