// Mix of optional structs and nested optionals
struct Sub {
    s: String;
}

struct Wrap {
    sub: Sub?;
}

contract TestContract {
    val: Wrap?;

    init() {
        self.val = null;
    }
}