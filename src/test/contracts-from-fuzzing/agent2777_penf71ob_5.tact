struct DeeplyNested {
    s1: Level1;
}

struct Level1 {
    s2: Level2;
    b: Bool;
}

struct Level2 {
    s3: Level3;
}

struct Level3 {
    num: Int;
    flag: Bool;
    text: String;
}

contract TestContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested {
            s1: Level1 {
                s2: Level2 {
                    s3: Level3 {
                        num: 42,
                        flag: true,
                        text: "deep"
                    }
                },
                b: false
            }
        };
    }
}