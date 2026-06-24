struct Nested {
    inside: Inner;
    flag: Bool;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    value: Nested = Nested{inside: Inner{a: 3, b: false}, flag: true};

    init() {
        self.value = Nested{inside: Inner{a: 1, b: true}, flag: false};
    }
}