struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

struct Nested {
    x: Inner1;
    y: Inner2;
}

contract StructOfStructs {
    n: Nested;

    init() {
        self.n = Nested {
            x: Inner1 { a: 1 },
            y: Inner2 { b: true }
        };
    }

    receive() {}
}