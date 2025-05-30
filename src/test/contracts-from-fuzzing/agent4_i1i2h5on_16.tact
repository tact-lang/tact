// Nested optional with defaulted inner
struct InnerDef {
    x: Int = 7;
    y: Bool = false;
}

struct WrapOpt {
    inner: InnerDef?;
}

contract TestContract {
    nestedOpt: WrapOpt;

    init() {
        self.nestedOpt = WrapOpt {
            inner: null
        };
    }
}
