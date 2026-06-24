struct NestedOptional {
    a: Int?;
    b: Bool;
}

struct OuterOpt {
    foo: NestedOptional?;
    bar: String;
}

contract NestedOptTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ foo: null, bar: "str" };
    }
}
