struct NestedDefaults {
    inner1: Int = 5;
    inner2: Bool = true;
}

struct OuterDefaults {
    n: NestedDefaults = NestedDefaults{inner1: 9, inner2: false};
    msg: String = "hello";
}

contract TestContract {
    defVals: OuterDefaults;

    init() {
        self.defVals = OuterDefaults{
            n: NestedDefaults{inner1: 100, inner2: true},
            msg: "changed"
        };
    }

    receive() {
        let _ = self.defVals.n.inner2;
    }
}