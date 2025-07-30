struct Params {
    a: Int?;
    b: Int? = null;
    c: Int? = null;
}

contract PartialDefaults {
    p: Params = Params{ a: null };
}