// optional struct pointer chain
struct InnerMost {
    n: Int;
}

struct Middle {
    m: InnerMost?;
}

struct Outer {
    o: Middle?;
}

contract OptionalChain {
    val: Outer;

    init() {
        self.val = Outer {
            o: null,
        };
    }
}