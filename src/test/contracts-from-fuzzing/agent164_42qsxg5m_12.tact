struct Deeply {
    a: Nested;
}

struct Nested {
    b: Nested2;
}

struct Nested2 {
    c: Int;
}

contract Compose {
    val: Deeply;

    init() {
        self.val = Deeply{ a: Nested{ b: Nested2{ c: 777 } } };
    }
}