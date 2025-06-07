struct OptChain {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: Cell?;
    quux: Slice?;
    corge: String?;
}

contract Test {
    opt: OptChain = OptChain{foo: null, bar: null, baz: null, qux: null, quux: null, corge: null};

    init() {
        self.opt = OptChain{foo: 1, bar: true, baz: myAddress(), qux: emptyCell(), quux: emptyCell().asSlice(), corge: "hi"};
    }
}
