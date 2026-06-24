struct Deep {
    val1: Int;
    val2: Bool;
    text: String;
    nested: Inner;
}

struct Inner {
    flag: Bool;
    count: Int;
    note: String;
}

contract DeeplyNested {
    storage: Deep;

    init() {
        self.storage = Deep{
            val1: 1,
            val2: true,
            text: "go",
            nested: Inner{
                flag: false,
                count: 99,
                note: "inner",
            },
        };
    }
}