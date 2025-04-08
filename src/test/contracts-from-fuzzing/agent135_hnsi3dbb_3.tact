struct Wrap {
    val: Bool?;
}

struct Outer {
    nested: Wrap;
}

contract Test {
    o: Outer;

    init() {
        self.o = Outer{ nested: Wrap{ val: true } };
    }
}