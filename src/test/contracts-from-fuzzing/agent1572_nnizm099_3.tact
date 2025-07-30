struct DeeplyNested {
    a: Int;
    b: String?;
}

struct Level2 {
    inner: DeeplyNested;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    text: String;
}

contract DeepNestContract {
    field: Level1 = Level1{
        l2: Level2{
            inner: DeeplyNested{
                a: 1,
                b: null
            },
            flag: false
        },
        text: "t"
    };

    init() {
        self.field = Level1{
            l2: Level2{
                inner: DeeplyNested{
                    a: 7,
                    b: "hi"
                },
                flag: true
            },
            text: "changed"
        };
    }
}
