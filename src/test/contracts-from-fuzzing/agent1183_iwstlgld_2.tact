struct Inner {
    flag: Bool;
    amount: Int;
    comment: String;
}

contract NestContract {
    data: Inner;

    init() {
        self.data = Inner{
            flag: true,
            amount: 42,
            comment: "nested",
        };
    }
}