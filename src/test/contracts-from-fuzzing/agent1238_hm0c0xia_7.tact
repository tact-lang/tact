struct Level3 {
    z: String;
}

struct Level2 {
    y: Level3;
    val: Int;
}

struct Level1 {
    x: Level2;
    flag: Bool;
}

struct Root {
    rootVal: Int;
    inner: Level1;
}

contract DeeplyNested {
    data: Root;
    init() {
        self.data = Root{
            rootVal: 99,
            inner: Level1{
                x: Level2{
                    y: Level3{ z: "deep" },
                    val: 123
                },
                flag: true
            }
        };
    }
}