struct Nested {
    x: Int;
    y: Bool?;
}

struct Outer {
    n: Nested;
    z: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            n: Nested{x: 10, y: true},
            z: "hello"
        };
    }
}