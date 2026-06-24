struct Nested {
    a: Int;
}

struct Wrap {
    n: Nested?;
}

contract C {
    val: Wrap;

    init() {
        self.val = Wrap{ n: null };
    }
}