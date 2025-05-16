struct Inside {
    foo: Int;
}

struct Wrap {
    inner: Inside?;
}

contract Test {
    val: Wrap;
    init() {
        self.val = Wrap{inner:null};
    }
}