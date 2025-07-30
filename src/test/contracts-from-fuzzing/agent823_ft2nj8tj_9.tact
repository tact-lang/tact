struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
}

struct Holder {
    inner: NestedDefaults;
}

contract ContainingDefaults {
    content: Holder;

    init() {
        self.content = Holder{ inner: NestedDefaults{} };
    }
}