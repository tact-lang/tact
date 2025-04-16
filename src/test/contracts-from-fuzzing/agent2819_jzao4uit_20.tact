// test optional bool field default assignment
struct OptBool {
    f: Bool? = null;
}

contract TestContract {
    val: OptBool;

    init() {
        self.val = OptBool{};
    }
}