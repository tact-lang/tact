struct Inner {
    x: Int;
}

contract TestContract {
    nestedOpt: Inner? = null;
    receive() {
        let _ = self.nestedOpt;
    }
}