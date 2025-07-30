struct SimpleNest {
    opt: Int?;
    flag: Bool;
}

struct Container {
    nested: SimpleNest;
}

contract ParamOfOptStruct {
    param: Container;

    init() {
        self.param = Container{
            nested: SimpleNest{
                opt: null,
                flag: true
            }
        };
    }
}
