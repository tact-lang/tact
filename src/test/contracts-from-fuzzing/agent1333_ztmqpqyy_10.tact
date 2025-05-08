message MyMsg {
    foo: Int;
}

contract TestContract {
    m: MyMsg? = null;

    init() {}

    receive() {
        if (self.m != null) {
            dump(self.m!!.foo);
        }
    }
}