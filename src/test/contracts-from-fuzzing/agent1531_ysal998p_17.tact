struct ComplexOptional {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

struct Holder {
    c1: ComplexOptional;
    c2: ComplexOptional;
}

contract OptTest {
    h: Holder;

    init() {
        self.h = Holder{
            c1: ComplexOptional{foo:null,bar:"x",baz:true},
            c2: ComplexOptional{foo:5,bar:null,baz:null},
        };
    }
}
