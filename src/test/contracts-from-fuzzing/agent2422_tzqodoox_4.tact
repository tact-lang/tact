struct OptionalDeep {
    innerOpt: Int?;
    boolOpt: Bool?;
}

struct Container {
    nested: OptionalDeep?;
    number: Int;
}

contract TestContract {
    container: Container;
    
    init() {
        self.container = Container{
            nested: null,
            number: 123
        };
    }
}