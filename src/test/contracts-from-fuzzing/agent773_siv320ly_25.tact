struct EmptyOpt {
    opt: Int?;
}

contract RelyNullDefault {
    s: EmptyOpt;

    init() {
        self.s = EmptyOpt{
            opt: null,
        };
    }
}