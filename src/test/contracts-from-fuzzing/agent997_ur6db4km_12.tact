struct ManyFields {
    a: Int;
    b: Bool;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int;
    h: Bool;
}

contract TestContract {
    data: ManyFields = ManyFields{
        a: 1,
        b: true,
        g: 7,
        h: false
    };
}