struct InnerOpt {
    s: String?;
}

contract UninitOptionalNested {
    field: InnerOpt;

    init() {
        self.field = InnerOpt{ s: null };
    }
}