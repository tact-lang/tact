struct ContainsBool {
    x: Int;
    b: Bool;
}

contract OptionalStructBool {
    opt: ContainsBool?;

    init() {
        self.opt = null;
    }
}
