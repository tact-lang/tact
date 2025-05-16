struct SVal {
    val: Int;
}

struct OptWrap {
    wrap: SVal?;
}

contract TestContract {
    f: OptWrap;

    init() {
        self.f = OptWrap{
            wrap: null
        };
    }
}