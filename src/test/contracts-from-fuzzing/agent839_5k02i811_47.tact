struct Innermost {
    deep: Int;
}

struct InnerContainer {
    inner: Innermost?;
}

contract DeepOpt {
    val: InnerContainer?;
    init() {
        self.val = null;
    }
}