struct DeepBool {
    active: Bool = true;
    child: NestedBool;
}

struct NestedBool {
    enabled: Bool = false;
}

contract RecursiveFlags {
    flags: DeepBool;
    init() {
        self.flags = DeepBool{ child: NestedBool{} };
    }
}
