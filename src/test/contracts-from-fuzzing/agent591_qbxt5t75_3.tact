struct OptionalNest {
    x: Int?;
    y: Bool?;
    z: NestedOpt?;
}

struct NestedOpt {
    m: Int;
    n: Bool;
}

contract OptTest {
    st: OptionalNest;

    init() {
        self.st = OptionalNest{
            x: null,
            y: true,
            z: NestedOpt{
                m: 5,
                n: false
            }
        };
    }
}