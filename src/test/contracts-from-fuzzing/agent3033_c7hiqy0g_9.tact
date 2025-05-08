struct InnerOptionals {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner: InnerOptionals?;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{ inner: null };
    }
}
