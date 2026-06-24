struct EmbeddedOptionals {
    sx: InnerOpt?;
    sy: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
}

contract EmbeddedOptionalsTest {
    emb: EmbeddedOptionals;
    init() {
        self.emb = EmbeddedOptionals{
            sx: InnerOpt{flag:true},
            sy: null
        };
    }
}