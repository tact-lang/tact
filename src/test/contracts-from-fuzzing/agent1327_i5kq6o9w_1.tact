struct Inner {
    val: Int;
    flag: Bool?;
    text: String;
}

contract Test {
    rec: Inner;

    init() {
        self.rec = Inner{val: 1, flag: null, text: "abc"};
    }
}
