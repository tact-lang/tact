struct FlatOpt {
    x1: Int?;
    x2: Int?;
}

struct NestedOptRec {
    x: FlatOpt?;
    y: String?;
}

contract FlatAndNestedOpt {
    val: NestedOptRec;

    init() {
        self.val = NestedOptRec{
            x: null,
            y: null,
        };
    }
}