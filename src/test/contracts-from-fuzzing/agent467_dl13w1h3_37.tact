// Optional struct inside nested optional struct (outer layer only)
struct MiddleOpt {
    x: Int?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract NestedOptionalStructOuter {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{middle: null};
    }
}
