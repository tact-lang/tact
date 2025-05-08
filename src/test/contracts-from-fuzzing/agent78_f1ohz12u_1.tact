struct Inner {
    flag: Bool;
    note: String;
}

contract TestContract {
    record: Inner;

    init() {
        self.record = Inner{
            flag: true,
            note: "hello"
        };
    }
}