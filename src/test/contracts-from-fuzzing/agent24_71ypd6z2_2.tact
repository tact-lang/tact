trait MyTrait {
    abstract fun required(): Int;
    virtual fun optional(): Int {
        return 5;
    }
}

contract TestContract() with MyTrait {
    override fun required(): Int {
        return 10;
    }

    receive() {
        dump(self.required() + self.optional());
    }
}
