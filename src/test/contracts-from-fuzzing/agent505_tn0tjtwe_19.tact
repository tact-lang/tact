struct ManyOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Address?;
}

contract OptFields {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{foo:null,bar:null,baz:null,qux:null};
    }
}
