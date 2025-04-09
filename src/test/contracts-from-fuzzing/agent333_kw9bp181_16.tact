contract TestContract {
    smallInt: Int as int4;
    largeInt: Int;

    init() {
        self.smallInt = 7;
        self.largeInt = 123456789;
    }
}