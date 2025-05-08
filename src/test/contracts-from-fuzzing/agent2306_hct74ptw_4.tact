struct Small { x: Int; }

contract NestedOptional {
    opt: Small?;

    init() {
        self.opt = null;
    }
}
