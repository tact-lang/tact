struct Wrapper {
    s: String?;
    a: Int?;
    b: Bool?;
}

contract DefaultNullWrap {
    w: Wrapper = Wrapper { s: null, a: null, b: null };
}