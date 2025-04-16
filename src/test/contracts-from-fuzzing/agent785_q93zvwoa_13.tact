struct EmptyOptional {
    f: Int?;
}

contract OptionalOfStruct {
    opt: EmptyOptional?;

    init() {
        self.opt = null;
    }
}