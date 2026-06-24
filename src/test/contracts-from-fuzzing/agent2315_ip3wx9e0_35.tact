// Struct with Bool and String defaults, nested in contract field
struct NV {
    b: Bool = true;
    s: String = "abc";
}

contract NestedDefaults {
    val: NV;

    init() {
        self.val = NV{};
    }
}