struct NestedOpt {
    i: Int?;
    s: String?;
}

contract OptStructOpt {
    val: NestedOpt?;

    init() {
        self.val = NestedOpt{
            i: null,
            s: null
        };
    }
}