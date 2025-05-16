struct HasBool {
    b: Bool;
}

struct HasNestedOpt {
    nested: HasBool?;
}

contract OptStructInsideOpt {
    st: HasNestedOpt;

    init() {
        self.st = HasNestedOpt{ nested: null };
    }
}