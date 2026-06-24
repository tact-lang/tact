struct Outermost {
    innermost: Int;
}

contract OptionalNestedStruct {
    opt: Outermost?;

    init() {
        self.opt = null;
    }
}