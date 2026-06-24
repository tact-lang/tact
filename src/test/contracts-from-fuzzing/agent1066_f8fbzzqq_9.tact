struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct ContainsOpt {
    inner: NestedOpt?;
    val: Int;
}

contract OptTest {
    data: ContainsOpt;

    init() {
        self.data = ContainsOpt{inner: null, val: 100};
    }
}