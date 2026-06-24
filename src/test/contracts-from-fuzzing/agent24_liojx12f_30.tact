// Struct with mixed defaulted and optional fields
struct Mix {
    a: Int = 7;
    b: Bool = false;
    c: Int?;
    d: String?;
}

contract Test {
    m: Mix = Mix{
        a: 7,
        b: false,
        c: null,
        d: null,
    };

    init() {}
}