struct DeepInner {
    p: Int;
    q: Bool;
    r: String;
}

struct Container {
    nestedOpt: DeepInner?;
    label: String;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            nestedOpt: null,
            label: "opt nested struct"
        };
    }
}