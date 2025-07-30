struct DeepInner {
    m: Int?;
    n: Bool = true;
    p: String?;
}

struct Mid {
    a: DeepInner?;
    b: Bool = false;
}

contract TestContract {
    field: Mid?;

    init() {
        self.field = null;
    }
}