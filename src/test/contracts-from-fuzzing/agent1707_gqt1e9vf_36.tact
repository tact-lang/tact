contract BitSized {
    smallInt: Int as int4;
    largeInt: Int;

    init() {
        self.smallInt = 4;
        self.largeInt = 123456789;
    }
}