struct SingleBool {
    flag: Bool;
}

struct NestedSingleBool {
    sb: SingleBool;
}

contract BoolStorage {
    s: NestedSingleBool;
    init() {
        self.s = NestedSingleBool{
            sb: SingleBool{ flag: true }
        };
    }
}