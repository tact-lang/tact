trait TraitConst {
    abstract const myConst: Int;
}

contract C() with TraitConst {
    override const myConst: Int = 123;

    receive() {
        dump(self.myConst);
    }
}
