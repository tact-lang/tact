// Check optional bools in struct
struct OptBools {
    b0: Bool?;
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
}

contract Test {
    opts: OptBools;

    init() {
        self.opts = OptBools{ b0: null, b1: true, b2: null, b3: false, b4: null };
    }
}