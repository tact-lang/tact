struct Defaults {
    x: Int = 1;
    y: Int = 2;
}

struct Outer {
    a: Defaults;
    b: Defaults;
}

contract TwoDefaults {
    val: Outer;

    init() {
        self.val = Outer{
            a: Defaults{},
            b: Defaults{}
        };
    }
}