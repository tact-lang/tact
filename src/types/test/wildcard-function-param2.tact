primitive Int;
primitive Bool;

trait BaseTrait { }

trait WildThing {
    virtual fun assure(_: Int, _: Int): Bool {
        return true;
    }
}

contract YouMakeMyHeartSing with WildThing {
    override fun assure(a: Int, b: Int): Bool {
        return a + b == b + a;
    }
}