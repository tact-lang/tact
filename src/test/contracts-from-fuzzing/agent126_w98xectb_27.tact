struct WrapOpt {
    n: Int?;
}

contract NestedNull {
    w: WrapOpt?;

    init() {
        self.w = null;
    }
}