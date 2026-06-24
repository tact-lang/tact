struct Inner1 { v: Int }
struct Inner2 { v: Int }
struct Inner3 { v: Int }
struct Combo {
    a: Inner1;
    b: Inner2?;
    c: Int?;
    d: Bool;
    e: String;
    f: Inner3?;
}

contract ComboPersistence {
    data: Combo;
    init() {
        self.data = Combo{
            a: Inner1{ v: 1 },
            b: null,
            c: null,
            d: false,
            e: "xyz",
            f: Inner3{ v: 42 },
        };
    }
}