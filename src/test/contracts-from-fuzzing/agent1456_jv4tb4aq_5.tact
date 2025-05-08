struct Level3 {
    val: Int;
}

struct Level2 {
    inner3: Level3;
    text: String?;
}

struct Level1 {
    inner2: Level2;
    flag: Bool;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            inner2: Level2{
                inner3: Level3{ val: 999 },
                text: "deep fuzz",
            },
            flag: true,
        };
    }

    receive() {
        self.deep = Level1{
            inner2: Level2{
                inner3: Level3{ val: 888 },
                text: null,
            },
            flag: false,
        };
    }
}