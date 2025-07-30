struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    nested: Nested;
    flag: Bool;
    number: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{
                x: 42,
                y: true,
                z: "zzz",
            },
            flag: false,
            number: 7
        };
    }
}
