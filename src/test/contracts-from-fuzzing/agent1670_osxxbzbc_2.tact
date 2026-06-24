struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContr {
    sfield: Inner?;

    init() {
        self.sfield = null;
    }
}