struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: Inner? = null;

    init() {}

    receive() {
        if (self.s != null) {
            let x = self.s!!.x;
            dump(x);
        }
    }
}