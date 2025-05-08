struct Tiny {
    a: Int;
}
struct Small {
    b: Tiny;
}
struct Medium {
    c: Small;
}
struct Large {
    d: Medium;
}

contract OptionalTinyToLarge {
    s: Large?;
    init() {
        self.s = null;
    }
}