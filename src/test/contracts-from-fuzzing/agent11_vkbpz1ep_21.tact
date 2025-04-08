/// deep nested optional primitive types inside an optional struct
struct DeepInner {
    a: Int?;
    b: String?;
}

struct Middle {
    inner: DeepInner?;
}

contract TestContract {
    storage: Middle?;

    init() {
        self.storage = null;
    }
}