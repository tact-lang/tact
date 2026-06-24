struct DeepNestDefaults {
    s: InnerDefaults;
}

struct InnerDefaults {
    a: Int = 42;
    b: OptInner?;
}

struct OptInner {
    x: Bool = true;
    y: String?;
}

contract DeepNestDefaultsTest {
    f: DeepNestDefaults;
    init() {
        self.f = DeepNestDefaults{
            s: InnerDefaults{
                b: OptInner{
                    y: null
                }
            }
        };
    }
}