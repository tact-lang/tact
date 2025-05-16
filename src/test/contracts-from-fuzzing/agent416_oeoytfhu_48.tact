struct HasOptional {
    maybeInt: Int?;
}

contract Test48 {
    opt: HasOptional;

    init() {
        self.opt = HasOptional { maybeInt: null };
    }
}
