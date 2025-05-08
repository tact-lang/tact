struct ManyNestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
}

contract ManyNestedOptContract {
    val: ManyNestedOpt;

    init() {
        self.val = ManyNestedOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}