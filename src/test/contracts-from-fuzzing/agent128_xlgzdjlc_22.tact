struct OptionalDeep {
    inner: OptionalMid?;
}

struct OptionalMid {
    leaf: OptionalLeaf?;
}

struct OptionalLeaf {
    x: Int;
}

contract TestContract {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            inner: OptionalMid{
                leaf: OptionalLeaf{
                    x: 42
                }
            }
        };
    }
}