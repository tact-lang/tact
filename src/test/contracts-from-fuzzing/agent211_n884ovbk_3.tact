struct Inner {
    perhaps: Int?;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    combined: Outer;

    init() {
        self.combined = Outer{ nested: null };
    }
}