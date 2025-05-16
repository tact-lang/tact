message(42) Msg {
    foo: Int;
}

contract TestContract {
    m: Msg? = null;

    init() {
        self.m = null;
    }
}