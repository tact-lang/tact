struct Varied {
    n: Int;
    s: String;
    b: Bool;
    optS: String?;
    optB: Bool?;
}

contract Test {
    v: Varied = Varied{
        n: 42,
        s: "hi",
        b: true,
        optS: null,
        optB: null
    };
}