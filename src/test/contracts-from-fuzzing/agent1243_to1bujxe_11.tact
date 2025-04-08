struct OptionalBranch {
    a: Int?;
}

struct Container {
    b: Bool;
    opt: OptionalBranch?;
}

contract Test {
    s: Container;
    init() {
        self.s = Container{ b: true, opt: null };
    }
}