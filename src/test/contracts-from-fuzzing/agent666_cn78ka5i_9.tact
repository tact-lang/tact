struct Inner {
    flag: Bool;
    name: String;
    num: Int;
}

contract Mixed {
    inner: Inner;
    count: Int;
    message: String;
    flag: Bool;

    init() {
        self.inner = Inner{
            flag: true,
            name: "abc",
            num: 0
        };
        self.count = 5;
        self.message = "hi";
        self.flag = false;
    }
}
