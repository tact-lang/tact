// optional boolean deeply nested
struct Outer {
    middle: Middle;
}

struct Middle {
    bit: Bool?;
}

contract OptBoolDeep {
    state: Outer;

    init() {
        self.state = Outer{ middle: Middle{ bit: null } };
    }
}