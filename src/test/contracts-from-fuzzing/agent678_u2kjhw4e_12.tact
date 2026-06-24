struct NestedOptional {
    innerOpt: Int?;
    strOpt: String?;
}

struct Container {
    nestedOpt: NestedOptional;
    boolVal: Bool;
}

contract TestContract {
    cont: Container;
    init() {
        self.cont = Container{
            nestedOpt: NestedOptional{ innerOpt: null, strOpt: null },
            boolVal: true
        };
    }
}