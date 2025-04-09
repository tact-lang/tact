struct ContainsInner {
    field: InnerOpt?;
}

struct InnerOpt {
    a: Int?;
    b: Bool;
}

contract Test {
    val: ContainsInner;
    init() {
        self.val = ContainsInner{ field: null };
    }
}