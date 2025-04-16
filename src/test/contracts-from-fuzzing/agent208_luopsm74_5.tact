struct OptDeepNested {
    inner: OptMid?;
}

struct OptMid {
    leaf: OptLeaf?;
    val: Int?;
}

struct OptLeaf {
    flag: Bool?;
    text: String?;
}

contract TestContract {
    data: OptDeepNested;

    init() {
        self.data = OptDeepNested{
            inner: OptMid{
                leaf: OptLeaf{
                    flag: null,
                    text: null
                },
                val: null
            }
        };
    }
}
