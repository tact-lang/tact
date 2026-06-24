struct DeepOptional {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
}

struct Container {
    nestedOpt: DeepOptional?;
    str: String;
}

contract TestContract {
    field: Container;
    
    init() {
        self.field = Container{
            nestedOpt: null,
            str: "test"
        };
    }
}
