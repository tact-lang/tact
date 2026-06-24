struct Base {
    foo: Int; bar: Bool?; baz: String?;
}

struct Container {
    a: Base?;
    b: Base;
}

contract DeepOpt {
    val: Container;

    init() {
        self.val = Container{
            a: null,
            b: Base{foo:1,bar:null,baz:"x"}
        };
    }
}