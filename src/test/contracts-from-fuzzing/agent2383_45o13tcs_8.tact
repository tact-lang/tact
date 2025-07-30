struct DeepOpt {
    innerOpt: Inner?;
}

struct Inner {
    val: Int?;
}

contract NestedNullable {
    data: DeepOpt;
    init() {
        self.data = DeepOpt{ innerOpt: Inner{ val: null } };
    }
}