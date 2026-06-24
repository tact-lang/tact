struct Gen {
    s: String;
    n: Int;
}

struct Container {
    inner: Gen;
}

contract StructDefault {
    field: Container;

    init() {
        self.field = Container{inner: Gen{s: "hi", n: 123}};
    }
}