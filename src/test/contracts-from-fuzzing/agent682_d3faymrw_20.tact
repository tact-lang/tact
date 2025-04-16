contract TestContract {
    a: Int;

    init() {
        self.a = 5;
        self.a = -99999999999999999999999999999;
    }
}