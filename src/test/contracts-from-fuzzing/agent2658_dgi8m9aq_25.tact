struct Mix {
    a: Int;
    b: String?;
    c: Bool;
}

contract NullableMixed {
    m: Mix = Mix{
        a: 6,
        b: null,
        c: true
    };
}