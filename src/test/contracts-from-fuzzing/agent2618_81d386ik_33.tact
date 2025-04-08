struct Composite {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
}

struct Wrapper {
    inner: Composite;
    optional_inner: Composite?;
}

contract CompositeWrap {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: Composite{ a:1, b:true, c:myAddress(), d:emptyCell(), e:"x" },
            optional_inner: null
        };
    }
}