// chain of optionals with intermediate non-optional fields
struct Leaf { x: Int }

struct Mid {
    optLeaf: Leaf?;
    flag: Bool;
}

struct Root {
    mid: Mid?;
    rootVal: Int;
}

contract OptionalChain {
    data: Root;
    init() {
        self.data = Root{
            mid: null,
            rootVal: 77,
        };
    }
}