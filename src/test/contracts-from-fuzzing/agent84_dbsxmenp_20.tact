struct NestedDefaultOpt {
    a: Bool = false;
    b: Int?;
    c: SubNest;
}

struct SubNest {
    x: Int = 1;
    y: Bool?;
}

contract NestedDefaultsTest {
    data: NestedDefaultOpt;
    init() {
        self.data = NestedDefaultOpt{
            b: null,
            c: SubNest{
                y: null,
            }
        };
    }
}
