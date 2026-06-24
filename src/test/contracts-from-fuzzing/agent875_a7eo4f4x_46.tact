struct NestedOptDefaults {
    a: Int=7;
    b: InnerDef?;
}

struct InnerDef {
    x: Bool=true;
    y: String?;
}

contract NestedOptDefsContract {
    data: NestedOptDefaults;
    init() {
        self.data = NestedOptDefaults{
            b: InnerDef{
                y: null
            }
        };
    }
}