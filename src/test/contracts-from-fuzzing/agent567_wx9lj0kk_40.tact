// nested optional with complex field types/defaults, not assigned
struct S {
    a: Int?;
    b: Bool = true;
    c: String?;
}

struct S2 {
    s: S?;
    x: Int = 7;
}

contract InitNothing {
    store: S2?;
}
