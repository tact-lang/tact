struct OptNested {
    inner: Int?;
}

struct Outer {
    nested: OptNested?;
}

contract OptNestTest {
    state: Outer;

    init() {
        self.state = Outer{ nested: null };
    }
}