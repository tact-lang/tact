struct OptInNested {
    a: Int?;
}

struct MidLayer {
    mid: OptInNested?;
}

contract TestContract {
    foo: MidLayer;
    init() {
        self.foo = MidLayer{mid: null};
    }
}