struct O1 {
    v: Int?;
}

struct O2 {
    nested: O1?;
}

contract OptNest {
    data: O2;
    init() {
        self.data = O2{ nested: null };
    }
}