struct Nested {
    level1: Bool;
    optLevel2: Middle?;
}

struct Middle {
    level2a: Int;
    level2b: String;
}

contract TestContract {
    val: Nested;

    init() {
        self.val = Nested{
            level1: true,
            optLevel2: Middle{
                level2a: 10,
                level2b: "hello",
            },
        };
    }
}
