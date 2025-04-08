contract TestContract {
    foo: Int as uint8;
    bar: Int as int64;
    flag: Bool;
    text: String;

    init() {
        self.foo = 255;
        self.bar = -42;
        self.flag = true;
        self.text = "hello";
    }
}