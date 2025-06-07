struct OptionalNested {
    s1: Inner1?;
    s2: Inner2?;
}

struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

contract TestContract {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{ s1: null, s2: null };
    }
}