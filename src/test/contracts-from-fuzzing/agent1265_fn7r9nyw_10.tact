struct OptionalNest {
    inner: InnerOpt?;
    label: String;
}

struct InnerOpt {
    x: Int;
    flag: Bool?;
}

contract NestOptTest {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{
            inner: null,
            label: "",
        };
    }
}