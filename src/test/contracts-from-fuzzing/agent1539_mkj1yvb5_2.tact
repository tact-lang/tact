struct Nested {
    x: Int;
    y: Bool?;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract DeepOptional {
    data: Outer;

    init() {
        self.data = Outer{ inner: Nested{ x: 10, y: null }, flag: true };
    }
}