struct HasOption {
    a: Int?;
    b: String?;
}

struct NestedOpt {
    opt: HasOption?;
    c: Int;
}

contract MultiOptional {
    st: NestedOpt;
    
    init() {
        self.st = NestedOpt{opt: null, c: 100};
    }
}