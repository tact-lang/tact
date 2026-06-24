struct Deepest {
    val: Int;
}

struct Deeper {
    inside: Deepest;
    txt: String;
}

struct DeepWrap {
    d: Deeper;
    flag: Bool;
}

contract MaxDepthTest {
    all: DeepWrap;

    init() {
        self.all = DeepWrap{
            d: Deeper{
                inside: Deepest{val: 1001},
                txt: "deepest",
            },
            flag: true,
        };
    }
}