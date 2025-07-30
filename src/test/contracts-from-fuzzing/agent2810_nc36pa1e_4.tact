struct Nested1 {
    a: Int;
    b: Bool;
}

struct Nested2 {
    c: String;
    d: Nested1;
}

contract NestTest {
    st: Nested2;

    init() {
        self.st = Nested2{
            c: "hi",
            d: Nested1 {
                a: 7,
                b: true,
            },
        };
    }
}
