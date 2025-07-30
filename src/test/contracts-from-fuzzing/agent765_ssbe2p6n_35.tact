struct UU {
    one: Int;
    two: Int;
}

contract OptionalStructVariables {
    maybeU: UU?;
    init() {
        self.maybeU = null;
    }
}