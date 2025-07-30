struct Nested {
    s: String;
    b: Bool?;
    num: Int;
}

struct Container {
    first: Nested;
    second: Nested;
    flag: Bool;
}

contract DeepTest {
    st: Container;

    init() {
        self.st = Container{
            first: Nested{
                s: "one",
                b: true,
                num: 10,
            },
            second: Nested{
                s: "two",
                b: null,
                num: 20,
            },
            flag: false,
        };
    }
}