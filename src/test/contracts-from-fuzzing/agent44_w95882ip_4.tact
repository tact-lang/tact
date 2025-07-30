contract TestContract {
    nums: map<Int, Int>;

    init() {
        self.nums = emptyMap();
    }

    receive() {
        let v = self.nums.get(1);
    }
}