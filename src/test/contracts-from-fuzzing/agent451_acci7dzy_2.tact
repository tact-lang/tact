struct Nested {
    inner: Bool;
}

struct Outer {
    n: Nested;
    flag: Bool;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            n: Nested{ inner: false },
            flag: true,
        };
    }
}