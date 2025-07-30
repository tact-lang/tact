struct ContainsOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Container {
    nested: ContainsOptionals;
    nestedOpt: ContainsOptionals?;
}

contract OptInsideOpt {
    cont: Container;

    init() {
        self.cont = Container{
            nested: ContainsOptionals{ f1:null, f2:null, f3:null },
            nestedOpt: null
        };
    }
}
