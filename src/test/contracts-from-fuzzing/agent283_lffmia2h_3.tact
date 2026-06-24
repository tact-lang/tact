struct Deep {
    level: Int;
    lower: Deeper;
}

struct Deeper {
    flag: Bool;
    bottom: Deepest;
}

struct Deepest {
    note: String;
    optInt: Int?;
}

contract DeepNest {
    data: Deep;

    init() {
        self.data = Deep {
            level: 1,
            lower: Deeper {
                flag: true,
                bottom: Deepest {
                    note: "bottom",
                    optInt: null
                }
            }
        };
    }
}