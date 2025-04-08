struct InnerMost { val: Int; }
struct Inner { nested: InnerMost?; }
struct Outer { wrapped: Inner?; }

contract OptNesting {
    data: Outer;

    init() {
        self.data = Outer{ wrapped: null };
    }
}