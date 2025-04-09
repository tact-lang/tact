struct Leaf {
    s: String;
}

struct Wrapper {
    opt: Leaf?;
}

contract OptionalNested {
    w: Wrapper;
    init() {
        self.w = Wrapper{ opt: null };
    }
}