struct Inner {
    flag: Bool;
    text: String;
}

contract Test {
    item: Inner;

    init() {
        self.item = Inner{flag: false, text: "foo"};
    }
}