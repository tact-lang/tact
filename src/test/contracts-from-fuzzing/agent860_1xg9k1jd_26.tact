struct NestBool {
    flag: Bool;
}

struct OptNestBool {
    nested: NestBool?;
}

contract BoolNestOpt {
    s: OptNestBool;
    init() {
        self.s = OptNestBool{ nested: null };
    }
}