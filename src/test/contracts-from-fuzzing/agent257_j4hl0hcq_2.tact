struct Inner {
    flag: Bool;
    text: String;
    amount: Int?;
}

contract TestContract {
    nested: Inner = Inner{
        flag: true,
        text: "hello",
        amount: null,
    };
}