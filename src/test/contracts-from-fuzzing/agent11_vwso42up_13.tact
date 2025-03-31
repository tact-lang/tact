contract TernaryGetter {
    x: Int = 100;

    receive() {}

    get fun get_message(flag: Bool): Int {
        return flag ? self.x : (-self.x);
    }
}
