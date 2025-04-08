struct Deeply {
    a: Int;
    b: Bool;
}

struct Nested {
    inside: Deeply;
    optVal: Bool?;
}

contract TestContract {
    item: Nested;

    init() {
        self.item = Nested{
            inside: Deeply{
                a: 7,
                b: false,
            },
            optVal: null,
        };
    }
}