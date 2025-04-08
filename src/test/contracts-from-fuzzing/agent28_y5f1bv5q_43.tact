struct OptNested {
    o1: Int?;
    o2: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    b: Bool?;
    s: String?;
}

contract Test {
    val: OptNested;

    init() {
        self.val = OptNested{
            o1: null,
            o2: null,
            inner: null
        };
    }
}