struct NestedDefaults {
    x: Int = 5;
    s: InnerDefaults;
}

struct InnerDefaults {
    y: Bool = false;
    z: String = "abc";
}

contract Test12 {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{
            s: InnerDefaults{}
        };
    }
}