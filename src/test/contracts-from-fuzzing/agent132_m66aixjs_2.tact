contract TestContract {
    foo: Int;
    bar: Bool;
    opt1: Int?;
    opt2: Bool?;
    text: String;

    init() {
        self.foo = 7;
        self.bar = true;
        self.opt1 = null;
        self.opt2 = false;
        self.text = "test";
    }
}