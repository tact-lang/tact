struct DeepInner {
    flag: Bool;
}

struct Middle {
    inner: DeepInner?;
}

contract TestContract {
    middle: Middle? = null;

    init() {}

    receive() {
        if (self.middle != null && self.middle!!.inner != null) {
            dump(self.middle!!.inner!!.flag);
        }
    }
}