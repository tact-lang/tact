struct Optionals {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: String?;
}

contract AllOpts {
    data: Optionals;
    init() {
        self.data = Optionals{
            foo:null, bar:null, baz:null, qux:null
        };
    }
}