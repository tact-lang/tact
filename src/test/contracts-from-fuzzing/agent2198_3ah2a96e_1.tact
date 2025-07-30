struct Inner {
    flag: Bool;
    note: String;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{flag: true, note: "hello"};
    }
}