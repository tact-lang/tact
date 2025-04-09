struct NestedBool {
    b1: Bool;
    b2: Bool?;
}

contract NestedBoolContract {
    data: NestedBool;

    init() {
        self.data = NestedBool{ b1: true, b2: null };
    }
}