struct OptInner {
    val: Int;
}

struct Holder {
    maybe: OptInner?;
}

contract TestContract {
    f: Holder;

    init() {
        self.f = Holder{
            maybe: OptInner{
                val: 99,
            },
        };
    }
}
