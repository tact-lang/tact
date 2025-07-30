struct DeepOpt {
    field: Int?;
}

struct MidOpt {
    nested: DeepOpt?;
}

contract Test {
    val: MidOpt;

    init() {
        self.val = MidOpt{ nested: null };
    }
}