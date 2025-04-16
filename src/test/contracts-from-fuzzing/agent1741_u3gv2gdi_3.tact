struct Nested {
    a: Int;
    b: Int?;
}

struct Outer {
    n: Nested;
    opt: Bool?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            n: Nested{a: 10, b: null},
            opt: true
        };
    }
}