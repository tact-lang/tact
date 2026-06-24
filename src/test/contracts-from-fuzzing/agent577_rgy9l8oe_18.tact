struct NestedDefaults {
    content: InnerDefault;
}

struct InnerDefault {
    x: Int = 5;
    y: Bool = false;
}

contract TestContract {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{ content: InnerDefault{} };
    }
}