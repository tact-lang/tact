struct Mid {
    f1: Int;
    f2: Int?;
    f3: String;
}

struct OuterWrap {
    m: Mid;
    flag: Bool;
}

contract WrapTest {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{
            m: Mid{
                f1: 11,
                f2: null,
                f3: "hi",
            },
            flag: false,
        };
    }
}