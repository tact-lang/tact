struct DeepOptional {
    innerOpt: Int?;
    nestedOpt: NestedOptional;
}

struct NestedOptional {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    var: DeepOptional;

    init() {
        self.var = DeepOptional{
            innerOpt: null,
            nestedOpt: NestedOptional{
                foo: null,
                bar: null
            }
        };
    }

    receive() {
        self.var = DeepOptional{
            innerOpt: 1,
            nestedOpt: NestedOptional{
                foo: 2,
                bar: true
            }
        };
    }
}