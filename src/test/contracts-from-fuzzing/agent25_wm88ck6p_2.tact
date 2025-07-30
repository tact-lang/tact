struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    f1: Int;
    f2: Nested;
    f3: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            f1: 10,
            f2: Nested{
                a: 5,
                b: null,
                c: "hi",
            },
            f3: true,
        };
    }
}