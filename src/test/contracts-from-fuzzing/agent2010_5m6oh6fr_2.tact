struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    x: Int;
    y: Nested;
    z: Address;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            x: 10,
            y: Nested{
                a: 1,
                b: null,
                c: "test",
            },
            z: myAddress(),
        };
    }
}
