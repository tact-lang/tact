contract TestContract {
    x: Int as uint8 = 123;
    y: Int as int4 = -4;
    flag: Bool = false;
    text: String = "hello";
    optInt: Int? = null;

    init() {
        self.optInt = 99;
    }
}