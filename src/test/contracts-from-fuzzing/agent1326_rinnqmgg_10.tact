struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
    flag: Bool = false;
}

contract NestedOptTest {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            nested: null,
            flag: true
        };
    }

    receive() {
        let _ = self.s;
    }
}