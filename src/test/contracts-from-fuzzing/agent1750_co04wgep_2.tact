struct Params {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    params: Params = Params{
        a: 5,
        b: true,
        c: "hello",
    };

    init() {}
}