struct Tiny1 { a: Int }
struct Tiny2 { b: Bool }
struct Tiny3 { c: String }

struct Big {
    a: Tiny1;
    b: Tiny2;
    c: Tiny3;
    d: Int?;
    e: Bool?;
    f: String;
}

contract Test {
    data: Big;

    init() {
        self.data = Big{
            a: Tiny1{a: 1},
            b: Tiny2{b: true},
            c: Tiny3{c: "hello"},
            d: null,
            e: false,
            f: "hi",
        };
    }
}
