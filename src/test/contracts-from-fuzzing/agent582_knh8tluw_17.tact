struct Mid {
    text: String;
    deep: Deepest;
}

struct Deepest {
    id: Int;
    name: String;
}

struct Top {
    number: Int;
    middle: Mid;
}

contract ChainNested {
    val: Top;

    init() {
        self.val = Top{
            number: 1,
            middle: Mid{
                text: "hi",
                deep: Deepest{
                    id: 2,
                    name: "deep"
                }
            }
        };
    }
}
