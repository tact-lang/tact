struct MultiNestedDefaults {
    a: Int = 1;
    s: String = "x";
}

struct Outer {
    x: MultiNestedDefaults;
    y: MultiNestedDefaults;
}

contract MultiDefaultNest {
    data: Outer;

    init() {
        self.data = Outer{
            x: MultiNestedDefaults{},
            y: MultiNestedDefaults{}
        };
    }
}
