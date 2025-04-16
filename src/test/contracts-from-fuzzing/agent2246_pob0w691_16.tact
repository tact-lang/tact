struct NestedDefaults {
    s: InnerDef;
    f: Bool;
}

struct InnerDef {
    a: Int = 5;
    b: String = "hi";
}

contract NestDefContract {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            s: InnerDef{},
            f: true
        };
    }
}
