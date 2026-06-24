contract Extras {
    first: Int;
    second: Int;
    third: Bool;

    init() {
        self.first = 1;
        self.second = 2;
        self.third = true;
    }

    receive() {
        self.third = false;
    }
}