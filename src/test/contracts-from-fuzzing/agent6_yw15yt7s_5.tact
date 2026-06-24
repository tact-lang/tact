// Test snippet for abstract constants in traits

trait TraitWithAbstractConst {
    abstract const myConst: Int;
}

contract ConstContract() with TraitWithAbstractConst {
    override const myConst: Int = 42;

    receive() {
        dump(self.myConst);
    }
}
