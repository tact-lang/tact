struct Inner {
    flag: Bool;
    number: Int;
    text: String;
}

contract Test {
    innerField: Inner;
    init() {
        self.innerField = Inner{flag: true, number: 42, text: "hi"};
    }
}