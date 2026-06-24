struct Small {
    foo: Int;
}
struct Wrap {
    s: Small?;
}

contract NestedOptWrap {
    f: Wrap;

    init() {
        self.f = Wrap{ s: null };
    }
}