// Test missing default for one inner deeply nested struct field

struct InnerMost {
    val: Int;
}

struct Middle {
    data: InnerMost;
    flag: Bool = false;
}

struct Outer {
    nested: Middle;
    str: String = "out";
}

contract TestContract {
    v: Outer;

    init() {
        self.v = Outer{
            nested: Middle{
                data: InnerMost{val: 123}
            }
        };
    }
}