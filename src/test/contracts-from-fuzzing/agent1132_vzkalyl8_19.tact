struct Compose {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: String?;
}

contract DefaultsAssign {
    c: Compose = Compose{
        a: 0, b: null, c: false, d: "", e: null
    };
}