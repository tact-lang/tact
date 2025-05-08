struct DeepDefault {
    s: InnerDefault;
}

struct InnerDefault {
    x: Int = 1;
    y: Bool = true;
}

contract TestContract {
    field: DeepDefault;

    init() {
        self.field = DeepDefault{s: InnerDefault{}};
    }
}