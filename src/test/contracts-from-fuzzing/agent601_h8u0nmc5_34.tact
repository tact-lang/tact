struct Human {
    iq: Int;
}

struct MaybeHuman {
    human: Human?;
}

contract ImplicitNullNestedOpt {
    data: MaybeHuman;

    init() {
        self.data = MaybeHuman{
            // omit 'human' on purpose to test default null for optional struct
        };
    }
}
