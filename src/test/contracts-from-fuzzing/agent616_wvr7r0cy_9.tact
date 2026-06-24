struct OptionalNest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptInState {
    optfield: OptionalNest;

    init() {
        self.optfield = OptionalNest{foo:null, bar:true, baz:null};
    }
}