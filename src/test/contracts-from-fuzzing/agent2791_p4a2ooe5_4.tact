struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    optInner: Inner?;
    flag: Bool;
    number: Int;
    text: String;

    init() {
        self.optInner = null;
        self.flag = false;
        self.number = 777;
        self.text = "testing";
    }
}
