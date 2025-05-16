struct Deep {
    x: Int;
    y: Bool?;
    z: String;
    flag: Bool;
}

struct Mid {
    deep: Deep;
    note: String;
}

contract NestedTest {
    info: Mid;

    init() {
        self.info = Mid{
            deep: Deep{x: 10, y: true, z: "hello", flag: false},
            note: "world"
        };
    }
}