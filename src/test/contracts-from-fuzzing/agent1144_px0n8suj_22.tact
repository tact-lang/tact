// try default = null with nested optional
struct InnerOpt2 { x: Int? = null; }

struct ContainerOpt {
    inner: InnerOpt2? = null;
}

contract NestedOptDefaults {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{};
    }
}