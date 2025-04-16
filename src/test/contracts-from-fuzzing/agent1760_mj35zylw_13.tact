struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: String;
    f: Int;
}

contract DefaultVals {
    data: Mix = Mix{
        a: 1,
        b: true,
        c: "a",
        d: null,
        e: "b",
        f: 42
    };

    init() {}
}