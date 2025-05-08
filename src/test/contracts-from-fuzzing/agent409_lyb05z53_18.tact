struct Combo {
    i: Int;
    b: Bool?;
    s: String;
    nested1: Nested1;
    nested2: Nested2;
}
struct Nested1 {
    foo: Int;
}
struct Nested2 {
    bar: Bool;
}

contract ComboContract {
    data: Combo;

    init() {
        self.data = Combo{
            i: 1,
            b: null,
            s: "hello",
            nested1: Nested1{ foo: 2 },
            nested2: Nested2{ bar: true },
        };
    }
}