struct Inner { x: Int; }

contract TestContract {
    s: Inner?;

    init() {
        self.s = null;
        dump(self.s!!.x);
    }
}