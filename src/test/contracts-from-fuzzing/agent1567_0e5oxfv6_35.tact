struct NestedPersistent {
    a: InnerPersist;
}

struct InnerPersist {
    b: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Bool;
    s: String;
    opt: Int?;
}

contract NestedPersistentTest {
    top: NestedPersistent;

    init() {
        self.top = NestedPersistent{
            a: InnerPersist{
                b: InnerMost{
                    x: 5,
                    y: true,
                    s: "zzz",
                    opt: null
                }
            }
        };
    }
}