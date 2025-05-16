struct NestedDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "default";
}

struct Container {
    nested: NestedDefaults;
}

contract TestNestedDefaults {
    val: Container;

    init() {
        self.val = Container{ nested: NestedDefaults{} };
    }

    receive() {
        self.val = Container{ nested: NestedDefaults{ a:100, b:false, c:"changed" } };
    }
}