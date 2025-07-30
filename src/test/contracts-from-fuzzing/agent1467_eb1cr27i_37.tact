struct NumWrap {
    val: Int?;
}

struct StringWrap {
    val: String?;
}

struct ComposeWrap {
    a: NumWrap;
    b: StringWrap;
}

contract ComposeNullable {
    n: ComposeWrap;
    init() {
        self.n = ComposeWrap{
            a: NumWrap{val:null},
            b: StringWrap{val:null}
        };
    }
}