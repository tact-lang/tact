struct NestedDefaults {
    a: Int = 1;
    nest: InnerDefaulted;
}
struct InnerDefaulted {
    x: Int = 2;
    y: Bool = false;
}

contract NestedDefaultsTest {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{
            nest: InnerDefaulted{}
        };
    }
}