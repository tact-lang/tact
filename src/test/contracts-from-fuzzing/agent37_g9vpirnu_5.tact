trait MyTrait {
    abstract fun abstractFun(): Int;
    fun wrapper(): Int {
        return self.abstractFun() + 1;
    }
}

contract TestContract() with MyTrait {
    override fun abstractFun(): Int {
        return 5;
    }

    receive() {
        dump(self.wrapper());
    }
}
