struct Inner {
    flag: Bool;
    note: String;
    count: Int;
    coin: Int as coins;
}

contract ComplexContract {
    innerData: Inner = Inner{
        flag: false,
        note: "hi",
        count: 10,
        coin: 0
    };
}