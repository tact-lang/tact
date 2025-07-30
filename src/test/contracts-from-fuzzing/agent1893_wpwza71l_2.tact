struct Nested {
    x: Int;
    y: Bool;
}

struct Outer {
    nest: Nested;
    flag: Bool;
}

contract DeepContract {
    data: Outer;

    init() {
        self.data = Outer{ nest: Nested{ x: 10, y: true }, flag: false };
    }
}