trait NestedTrait {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TraitDeep with NestedTrait {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{
            a: 55,
            b: true,
        };
    }
}