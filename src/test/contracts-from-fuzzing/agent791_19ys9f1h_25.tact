struct Options {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Int?;
    e: Bool?;
}

contract TestContract {
    options: Options = Options{
        a: null,
        b: true,
        c: null,
        d: 5,
        e: null
    };
}
