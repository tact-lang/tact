struct Inner3 {
    z: Int? = null;
}

struct Inner2 {
    y: Inner3? = null;
}

struct Inner1 {
    x: Inner2? = null;
}

contract NestedOptDefaults {
    data: Inner1;

    init() {
        self.data = Inner1{};
    }
}