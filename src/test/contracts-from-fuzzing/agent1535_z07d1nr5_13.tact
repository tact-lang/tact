struct Nested {
    z: Int;
    s: String;
}

struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Nested;
    e: Nested?;
}

contract PersistCombo {
    data: Combo = Combo{
        a: 10,
        b: true,
        c: "combo",
        d: Nested{z: 1, s:"hi"},
        e: null,
    };
}
