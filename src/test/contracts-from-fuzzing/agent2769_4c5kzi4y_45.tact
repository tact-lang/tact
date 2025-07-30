struct Wrap {
    a: Bool;
    b: String;
    c: Int?;
}

contract DefaultsComplex {
    val: Wrap = Wrap{
        a: false,
        b: "",
        c: null,
    };
}