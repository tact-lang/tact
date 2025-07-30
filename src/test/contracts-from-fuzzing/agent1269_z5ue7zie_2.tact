contract TestContract {
    first: Int = 1;
    second: Bool = true;
    third: String = "abc";
    fourth: Address; // no default

    init() {
        self.first = 10;
        self.second = false;
        self.third = "xyz";
        self.fourth = myAddress();
    }
}