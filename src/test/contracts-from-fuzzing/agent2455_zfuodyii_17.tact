struct Nester {
    s1: String;
    s2: String?;
    b: Bool;
    b2: Bool?;
    c: Cell;
    slice: Slice;
}

contract NestedWDefaults {
    data: Nester?;

    init() {
        self.data = null;
    }
}