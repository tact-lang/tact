struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct WithNested {
    inner: NestedDefaults;
    s: String = "k";
}

contract DefaultsNested {
    val: WithNested;

    init() {
        self.val = WithNested{
            inner: NestedDefaults{ a:2, b:true },
            s: "hi"
        };
    }
}