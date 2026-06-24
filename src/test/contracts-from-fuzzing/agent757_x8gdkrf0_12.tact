message MyMsg {
    foo: Int;
}

contract TestContract {
    maybeMsg: MyMsg? = null;

    init() {
        // keep null
    }
}