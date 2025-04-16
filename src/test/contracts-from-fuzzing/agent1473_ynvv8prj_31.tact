struct OptWrap {
    inner: Wrap?;
}

struct Wrap {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    ow: OptWrap;

    init() {
        self.ow = OptWrap{inner:null};
    }
}