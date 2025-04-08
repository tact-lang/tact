struct NestedOpt {
    innerVal: Int?;
    flag: Bool;
}

contract NestedOptTest {
    data: NestedOpt?;

    init() {
        self.data = NestedOpt{
            innerVal: null,
            flag: true
        };
    }
}