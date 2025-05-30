struct Container {
    flag: Bool;
    nested: Inner;
}

struct Inner {
    s: String?;
    v: Int?;
}

contract DifferentTypesOptionalNested {
    data: Container;
    init() {
        self.data = Container{flag:true, nested:Inner{s:null, v:null}};
    }
}