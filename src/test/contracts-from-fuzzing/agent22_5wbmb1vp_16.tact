struct NestedManyOptional {
    inner: Int?;
    inners: InnerStruct?;
}

struct InnerStruct {
    foo: String?;
    bar: Bool?;
}

contract TestContract {
    nmopt: NestedManyOptional;

    init() {
        self.nmopt = NestedManyOptional{inner: null, inners: null};
    }
}