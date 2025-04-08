struct OptionNested {
    n: Inner?;
}

struct Inner {
    x: Int = 5;
    y: Bool = true;
}

contract TestContract {
    val: OptionNested = OptionNested{};
    init() {}
    receive() {
        if (self.val.n != null) {
            let _ = self.val.n!!.x;
        }
    }
}