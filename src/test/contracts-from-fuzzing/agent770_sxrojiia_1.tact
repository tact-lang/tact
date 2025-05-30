struct Inner {
    flag: Bool;
    amount: Int;
    text: String;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            flag: true,
            amount: 42,
            text: "hello"
        };
    }
}