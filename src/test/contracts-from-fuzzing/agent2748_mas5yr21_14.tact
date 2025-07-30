struct EmbedOpt {
    optStr: String?;
}

struct Mid {
    inner: EmbedOpt;
}

contract OptInsideStruct {
    data: Mid;

    init() {
        self.data = Mid{
            inner: EmbedOpt{
                optStr: null
            }
        };
    }
}