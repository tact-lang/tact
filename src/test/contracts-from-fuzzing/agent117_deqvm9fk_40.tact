// optional deeply nested inside optional in contract
struct Sub {
   x: Int;
}

contract NestedOptionalDeep {
    opt: Sub?;

    init() {
        self.opt = Sub{x:42};
    }
}
