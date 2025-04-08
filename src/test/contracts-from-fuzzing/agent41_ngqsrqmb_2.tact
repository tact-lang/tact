struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    n: Nested;
    flag: Bool;
    count: Int;
}

contract TestNested {
    storage: Outer;
    init() {
        self.storage = Outer{
            n: Nested{
                x: 5,
                y: false,
                z: "hello",
            },
            flag: true,
            count: 10,
        };
    }
}