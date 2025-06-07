struct In {
    x: Int = 1;
    y: Bool = true;
}

struct Out {
    inner: In? = null;
    n: Int = 5;
}

contract Test {
    val: Out;

    init() {
        self.val = Out{};
    }
}