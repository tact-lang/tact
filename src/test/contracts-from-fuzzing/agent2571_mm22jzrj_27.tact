struct Inherited {
    foo: Int;
    bar: String?;
}

contract DoubleFields {
    one: Inherited;
    two: Inherited;

    init() {
        self.one = Inherited{foo:1,bar:null};
        self.two = Inherited{foo:2,bar:"hi"};
    }
}
