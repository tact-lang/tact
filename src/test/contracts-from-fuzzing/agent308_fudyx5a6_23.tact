struct OptionalDeep {
    inner: Mid?;
}

struct Mid {
    leaf: Leaf;
}

struct Leaf {
    number: Int;
}

contract OptDeepExample {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            inner: Mid{
                leaf: Leaf{number:99}
            }
        };
    }
}
