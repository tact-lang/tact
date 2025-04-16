struct Nested {
    innermost: Inner;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract TestContract {
    deep: Nested;

    init() {
        self.deep = Nested{innermost: Inner{value: 42, flag: false}};
    }
}
