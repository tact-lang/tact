struct Inner {
    flag: Bool;
    data: Int?;
}

contract InlineDefaultVal {
    s: Inner = Inner{ flag: true, data: null };

    init() {}
}