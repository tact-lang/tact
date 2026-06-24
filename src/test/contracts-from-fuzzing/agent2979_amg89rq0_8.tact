struct NestedOpt {
    foo: Int?;
    bar: Bool;
}

contract NestedOptTest {
    data: NestedOpt?;

    init() {
        self.data = NestedOpt{ foo:null, bar:true };
    }
}