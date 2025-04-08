struct Params {
    a: Int?;
    b: Bool? = null;
    c: String = "hello";
    d: Int = 42;
}

contract MixedDefaults {
    p: Params = Params{
        a: null,
        b: null,
        c: "world",
        d: 99,
    };
}