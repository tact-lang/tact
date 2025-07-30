struct Sub {
    foo: Int?;
    bar: Bool?;
}

struct Nested {
    a: Sub;
    b: Sub?;
}

contract TestContract {
    s: Nested;

    init() {
        self.s = Nested{
            a: Sub{ foo: null, bar: null },
            b: null
        };
    }
}