struct Nested {
    a: Int;
    b: Int?;
}

struct Outer {
    f1: Int;
    f2: Bool;
    f3: Nested;
    f4: String;
}

contract ComplexStorage {
    x: Outer;

    init() {
        self.x = Outer{
            f1: 1,
            f2: true,
            f3: Nested{a: 7, b: null},
            f4: "hello"
        };
    }
}