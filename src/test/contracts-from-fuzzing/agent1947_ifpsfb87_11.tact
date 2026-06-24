struct Tiny {
    b: Bool;
    i: Int;
}

struct Small {
    t: Tiny;
    s: String;
}

contract OptionalDeep {
    smallOpt: Small?;
    init() {
        self.smallOpt = null;
    }
}