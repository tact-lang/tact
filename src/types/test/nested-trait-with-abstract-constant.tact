primitive Int;
trait BaseTrait {}

trait TraitA {
    abstract const FOO: Int;
    virtual fun getValue(): Int {
        return 10;
    }
}

trait TraitB with TraitA {
    override fun getValue(): Int {
        return self.FOO;
    }
}

contract C with TraitB {
    override const FOO: Int = 10;

    receive() {
        // nothing
    }
}
