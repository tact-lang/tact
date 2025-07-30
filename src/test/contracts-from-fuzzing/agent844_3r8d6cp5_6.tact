struct OptionalNest {
    s: String?;
    f: Bool?;
    n: Int?;
}

contract OptFields {
    a: Int = 1;
    b: OptionalNest = OptionalNest{s:null, f:null, n:null};
}