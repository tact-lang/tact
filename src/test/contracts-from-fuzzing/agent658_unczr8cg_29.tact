struct OptInStruct {
    foo: Int?;
}

struct Container {
    s: OptInStruct;
}

contract NestedOptInside {
    f: Container;

    init() {
        self.f = Container{
            s: OptInStruct{foo:null}
        };
    }
}