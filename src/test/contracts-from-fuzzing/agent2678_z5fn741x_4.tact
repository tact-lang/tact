struct OptionWrap {
    val: Int?;
    txt: String?;
}

contract TestOptNested {
    data: OptionWrap;

    init() {
        self.data = OptionWrap{
            val: null,
            txt: "abc"
        };
    }
}