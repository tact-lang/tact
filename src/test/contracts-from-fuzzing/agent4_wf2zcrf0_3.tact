struct DeepNest {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: DeepNest;
    flag: Bool;
}

contract DeepContract {
    state: Outer;

    init() {
        self.state = Outer{ inner: DeepNest{ a: 42, b: true }, flag: false };
    }
}