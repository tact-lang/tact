struct Nested {
    z: Int;
    s: String;
}

struct Outer {
    n: Nested;
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer {
            n: Nested { z: 42, s: "nest" },
            flag: false,
            num: 100
        };
    }
}