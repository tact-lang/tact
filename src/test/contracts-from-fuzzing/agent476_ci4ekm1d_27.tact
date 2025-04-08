struct MultOpt {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: Cell?;
    quux: Slice?;
    corge: String?;
}

contract OptMulti {
    val: MultOpt;

    init() {
        self.val = MultOpt{foo:null, bar:null, baz:null, qux:null, quux:null, corge:null};
    }

    receive() {
        if (self.val.foo != null) {
            let _ = self.val.foo!!;
        }
    }
}