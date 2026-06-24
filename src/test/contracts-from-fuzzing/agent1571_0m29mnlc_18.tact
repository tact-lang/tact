struct NumPair {
    x: Int = 0;
    y: Int = 0;
}

contract TestContract {
    nums: NumPair = NumPair{};

    init() {
        self.nums = NumPair{ x: 123, y: 456 };
    }
}