struct Nested {
    x: Int;
    y: Bool;
}

struct Wrapper {
    nested: Nested;
    flag: Bool;
}

contract Test {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            nested: Nested{
                x: 42,
                y: false
            },
            flag: true
        };
    }
}
