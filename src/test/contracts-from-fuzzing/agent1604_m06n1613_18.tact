struct Inner1 {
    a: Int;
    b: Int;
}

struct Inner2 {
    x: Bool;
    y: Bool;
}

struct Combo {
    first: Inner1;
    second: Inner2;
}

contract NestedCombo {
    val: Combo;

    init() {
        self.val = Combo{
            first: Inner1{ a: 10, b: 20 },
            second: Inner2{ x: true, y: false }
        };
    }

    receive() {}
}