struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Mid {
    leafOpt: Leaf?;
}

contract OptionalNested {
    data: Mid;

    init() {
        self.data = Mid{ leafOpt: null };
    }
}