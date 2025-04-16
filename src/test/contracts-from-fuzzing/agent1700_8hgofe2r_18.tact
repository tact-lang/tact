struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct Container {
    nested: InnerOpt?;
    name: String;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            nested: InnerOpt{foo:null, bar:null},
            name: "hi"
        };
    }
}