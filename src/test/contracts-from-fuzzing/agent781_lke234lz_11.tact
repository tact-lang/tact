struct NestedMany {
    a: Int = 1;
    b: Nested1;
    c: Nested2;
    d: Nested3;
}

struct Nested1 {
    x: Int = 11;
    y: String?;
}

struct Nested2 {
    p: Bool = true;
    q: Int?;
}

struct Nested3 {
    zz: Nested4;
}

struct Nested4 {
    rr: Int?;
    tt: String = "hi";
}

contract DeepDiverse {
    val: NestedMany;

    init() {
        self.val = NestedMany{
            a: 2,
            b: Nested1{ x: 22, y: null },
            c: Nested2{ p: false, q: null },
            d: Nested3{ zz: Nested4{ rr: null, tt: "hello" } },
        };
    }
}