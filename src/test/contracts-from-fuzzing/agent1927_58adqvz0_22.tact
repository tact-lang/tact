struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    inner: DeepOptionals?;
}

contract NullLayer {
    val: Container?;

    init() {
        self.val = null;
    }
}