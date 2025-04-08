struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract ManyOptionalStruct {
    m: ManyOptionals = ManyOptionals{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null
    };
}