struct Sub {
    a: Int?;
    b: Bool?;
    c: Address?;
}

struct Top {
    s: Sub;
}

contract TestContract {
    field: Top = Top{ s: Sub{ a: null, b: null, c: null } };
}
