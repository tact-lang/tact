// Test 2: Using underscore as function parameter in trait (Valid usage)

trait WildTrait {
    virtual fun assure(_: Int, _: Int): Bool {
        return true;
    }
}

contract Impl with WildTrait {
    override fun assure(a: Int, b: Int): Bool {
        return a + b == b + a;
    }

    receive() {}
}
