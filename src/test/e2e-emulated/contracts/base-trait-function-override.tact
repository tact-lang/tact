trait OverrideBaseTraitFunction {
    value: Int;

    override fun notify(body: Cell?) {
        self.value = 1000;
    }
}

contract BaseTraitsFunctionContract with OverrideBaseTraitFunction {
    value: Int = 0;

    receive() {
        // deploy
    }

    get fun value(): Int {
        self.notify(null);
        return self.value;
    }
}
