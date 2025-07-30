struct Nested {
    val: Int;
    flag: Bool;
}

struct Mid {
    nest: Nested;
    anotherFlag: Bool;
}

struct Root {
    m: Mid;
    s: String;
}

contract Levels {
    root: Root;

    init() {
        self.root = Root{
            m: Mid{
                nest: Nested{ val: 10, flag: true },
                anotherFlag: false
            },
            s: "hi"
        };
    }
}
