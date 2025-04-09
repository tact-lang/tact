struct Sub {
    b: Bool?;
    s: String;
}

struct Mid {
    inner: Sub?;
    n: Int;
}

struct Top {
    m: Mid?;
    flag: Bool;
}

contract Combo {
    st: Top = Top{ m: null, flag: true };
}