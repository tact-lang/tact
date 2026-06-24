// optional struct with serialization inner
struct Inner {
    val: Int as uint16;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{ nested: null };
    }
}