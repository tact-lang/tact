struct OptOptOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

struct WrapperOpt {
    item: OptOptOpt?;
}

contract OptionWrapped {
    val: WrapperOpt;

    init() {
        self.val = WrapperOpt{ item: null };
    }
}