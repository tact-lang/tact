struct VeryDeep {
    inner: Int;
}

contract NestedInOptional {
    opt: VeryDeep?;
    init() {
        self.opt = null;
    }
}