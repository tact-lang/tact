struct Tiny1 {
    foo: Int;
}

struct Tiny2 {
    bar: Int;
}

struct Combo {
    s1: Tiny1?;
    s2: Tiny2?;
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

contract TestContract {
    combo: Combo = Combo{
        s1: null,
        s2: null,
        i: null,
        b: null,
        s: null,
        a: null
    };
}
