// Optional outer struct with nested optionals recursively
struct InnerMost {
    val: Int?;
}

struct MidLayer {
    data: InnerMost?;
}

struct Outermost {
    m: MidLayer?;
}

contract RecursiveOpt {
    s: Outermost?;

    init() {
        self.s = Outermost{ m: MidLayer{ data: InnerMost{ val: null } } };
    }
}