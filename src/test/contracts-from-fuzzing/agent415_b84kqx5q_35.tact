struct OneOptBool {
    x: Bool?;
}

contract StructOptBoolInField {
    s: OneOptBool;

    init() {
        self.s = OneOptBool{x: null};
    }
}