struct D {
    foo: Int?;
    bar: Bool?;
}

struct C {
    d: D?;
    text: String?;
}

contract TestContract {
    storage: C?;

    init() {
        self.storage = null;
    }
}