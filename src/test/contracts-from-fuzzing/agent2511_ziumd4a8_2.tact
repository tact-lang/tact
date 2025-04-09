struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract Store {
    stuff: Outer;

    init() {
        self.stuff = Outer{
            inner: Nested{
                x: 123,
                y: false,
                z: "abc"
            },
            flag: true
        };
    }
}