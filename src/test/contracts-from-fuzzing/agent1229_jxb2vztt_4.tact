struct Inner {
    flag: Bool;
    txt: String;
}

contract OptionalStructField {
    data: Inner?;

    init() {
        self.data = Inner{flag: true, txt: "hello"};
    }
}
