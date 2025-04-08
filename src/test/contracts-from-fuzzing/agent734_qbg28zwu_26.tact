struct Deep {
    foo: Int;
    nested1: Nested;
    nested2: Nested;
}

struct Nested {
    bar: Bool;
    txt: String?;
}

contract TestContract {
    d: Deep;

    init() {
        self.d = Deep{
            foo: 0,
            nested1: Nested{ bar: true, txt: null },
            nested2: Nested{ bar: false, txt: "hi" }
        };
    }
}