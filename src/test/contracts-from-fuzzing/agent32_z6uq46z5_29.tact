struct S1 {
    x: Int = 1;
}

struct S2 {
    y: Int = 2;
}

struct Combo {
    a: S1 = S1{};
    b: S2 = S2{};
}

contract ComboDefaults {
    c: Combo = Combo{};
}
