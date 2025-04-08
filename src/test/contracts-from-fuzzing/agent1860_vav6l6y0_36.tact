struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
}

contract OptDefaults2 {
    val: ManyOpts = ManyOpts{
        a: null, b: null, c: null, d: null, e: null, f: null
    };
}