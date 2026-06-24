struct Strange {
    s: String;
    b: Bool;
    i: Int;
    opt1: Bool?;
    opt2: String?;
    opt3: Int?;
}

contract DefaultsOpt {
    data: Strange = Strange{
        s: "hello",
        b: true,
        i: 42,
        opt1: null,
        opt2: null,
        opt3: null
    };

    init() {}
}