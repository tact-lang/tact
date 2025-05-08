struct NestedOpt {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    val: Int;
}

contract NestedOptTest {
    data: NestedOpt;
    init() {
        self.data = NestedOpt{ innerOpt: null };
    }
}