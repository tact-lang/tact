struct Nested {
    x: Int?;
}

contract TestContract {
    s: Nested? = null;

    init() {}

    receive() {
        if (self.s != null) {
            let innerOpt = self.s!!.x;
            if (innerOpt != null) {
                dump(innerOpt!!);
            }
        }
    }
}