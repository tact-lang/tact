struct OptDeep {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    leaf: Leaf?;
}

struct Leaf {
    text: String?;
}

contract Test {
    s: OptDeep;

    init() {
        self.s = OptDeep{
            inner: Inner{
                flag: true,
                leaf: Leaf{ text: null }
            }
        };
    }

    receive() {}
}