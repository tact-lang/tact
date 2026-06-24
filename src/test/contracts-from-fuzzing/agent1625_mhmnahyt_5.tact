struct EmbeddedOptional {
    child: InnerOptional;
}

struct InnerOptional {
    val: Int?;
    val2: Int;
}

contract InheritedOptionalStorage {
    s: EmbeddedOptional;

    init() {
        self.s = EmbeddedOptional{
            child: InnerOptional{
                val: null,
                val2: 321,
            },
        };
    }
}
