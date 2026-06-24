struct Opts1 {
    foo: Int?;
    bar: Bool?;
}

struct Opts2 {
    baz: Int?;
    qux: Bool?;
    nest: Opts1;
}

contract OptionalChain {
    field: Opts2;

    init() {
        self.field = Opts2{
            baz:null, qux:null, nest:Opts1{foo:null, bar:null}
        };
    }
}