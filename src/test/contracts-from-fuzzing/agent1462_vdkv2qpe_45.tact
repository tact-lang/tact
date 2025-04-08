// optional of struct with another optional field with nested optional
struct Leaf {
    foo: Int?;
}

struct S {
    leaf: Leaf?;
    bar: Bool;
}

contract OfSOpt {
    s: S?;

    init() {
        self.s = null;
    }
}