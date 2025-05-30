struct EmbedOpt {
    num: Int?;
    txt: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
}

contract MultiLevelOptionals {
    data: EmbedOpt;

    init() {
        self.data = EmbedOpt{
            num: null,
            txt: null,
            inner: null,
        };
    }
}