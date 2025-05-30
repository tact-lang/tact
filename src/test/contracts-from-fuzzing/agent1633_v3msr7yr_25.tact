struct EmptyOpt {
    opt: Int?;
}

contract OnlyEmptyOptional {
    s: EmptyOpt;

    init() {
        self.s = EmptyOpt{ opt: null };
    }
}