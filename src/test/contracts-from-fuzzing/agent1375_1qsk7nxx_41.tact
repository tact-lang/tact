struct Core {
    num: Int;
    label: String;
}

struct Wrap {
    inner: Core;
}

contract StructWrap {
    w: Wrap;

    init() {
        self.w = Wrap{inner: Core{num: 1, label: "lbl"}};
    }
}