struct EmbeddedOptional {
    val: Int?;
}

struct WithEmbeddedOpt {
    nested: EmbeddedOptional;
    flag: Bool;
}

contract EmbeddedOptStorage {
    val: WithEmbeddedOpt;

    init() {
        self.val = WithEmbeddedOpt{
            nested: EmbeddedOptional{ val: null },
            flag: true,
        };
    }
}