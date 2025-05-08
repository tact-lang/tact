struct DeepDefault {
    nested: Int = 42;
    opt: Int?;
}

struct Outer {
    inner: DeepDefault = DeepDefault{};
    flag: Bool = false;
}

contract TestContract {
    obj: Outer;

    init() {
        self.obj = Outer{};
    }
}