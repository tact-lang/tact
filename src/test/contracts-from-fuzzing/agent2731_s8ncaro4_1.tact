struct Nested {
    s1: String;
    s2: String;
    num: Int;
}

struct Outer {
    x: Int;
    y: Nested;
    z: Bool;
}

contract StorageTest {
    val: Outer;

    init() {
        self.val = Outer{
            x: 10,
            y: Nested{s1: "a", s2: "b", num: 5},
            z: true
        };
    }
}