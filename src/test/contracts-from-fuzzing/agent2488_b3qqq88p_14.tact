struct Leaf {
    val: Int;
}

struct Mid {
    child: Leaf?;
    num: Int;
}

contract SkipNestedOpt {
    data: Mid;

    init() {
        self.data = Mid{
            num: 44
            // child omitted
        };
    }
}