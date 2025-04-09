struct Nested {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract DeepTest {
    state: Outer;
    init() {
        self.state = Outer{ inner: Nested{ x: 5, y: false }, flag: true };
    }
    receive() {}
}