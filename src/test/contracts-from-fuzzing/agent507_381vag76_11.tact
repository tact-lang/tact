struct NestedDefaults {
    a: Inner;
}

struct Inner {
    x: Int = 1;
    y: Bool = false;
    s: String = "default";
}

contract TestContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            a: Inner{}
        };
    }
}