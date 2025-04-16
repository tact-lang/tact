contract TestContract {
    num: Int = 21 + 21;

    init() {}

    get fun value(): Int {
        return self.num;
    }
}