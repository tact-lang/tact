// Nested optional struct inside optional struct
struct InnerMostOpt {
    a: Int?;
}

struct MidOpt {
    inner: InnerMostOpt?;
}

contract NestedOptionalStructOpt {
    val: MidOpt;

    init() {
        self.val = MidOpt{ inner: null };
    }
}