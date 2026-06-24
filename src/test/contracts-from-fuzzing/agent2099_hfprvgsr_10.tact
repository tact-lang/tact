struct LargeNested {
    a: Int;
    b: String;
    c: Bool;
    d: Sub1;
    e: Sub2;
}

struct Sub1 {
    x: Int;
    y: Int;
}

struct Sub2 {
    foo: String;
    bar: Bool;
}

contract LargeNestedContract {
    s: LargeNested;

    init() {
        self.s = LargeNested{
            a: 1,
            b: "text",
            c: true,
            d: Sub1{x: 10, y: 20},
            e: Sub2{foo: "more", bar: false}
        };
    }
}