struct Leaf {
    val: Int?;
}

struct Wrap {
    leafOpt: Leaf?;
}

contract OptOfStructWithOpt {
    data: Wrap;
    init() {
        self.data = Wrap{
            leafOpt: null
        };
    }
}
