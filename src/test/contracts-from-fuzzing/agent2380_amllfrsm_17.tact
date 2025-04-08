// optional struct nested inside struct with optional inside that
struct DeepInside {
    val: Int?;
}

struct Holder {
    nested: DeepInside?;
}

contract TestContract {
    value: Holder;
    init() {
        self.value = Holder{ nested: null };
    }
}