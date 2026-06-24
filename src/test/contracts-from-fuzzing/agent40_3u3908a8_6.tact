trait WildThing {
    virtual fun assure(_: Int, _: Int): Bool {
        return true;
    }
}

contract Test with WildThing {
    receive() {}

    override fun assure(a: Int, b: Int): Bool {
        return a + b == b + a;
    }
}
