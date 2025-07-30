struct Inner {
    nested: Int?;
    flag: Bool;
    amount: Int as uint32;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            nested: null,
            flag: true,
            amount: 1234
        };
    }
}