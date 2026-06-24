struct OptNested {
    innerVal: Int?; 
    flag: Bool?;
}

struct Container {
    nested: OptNested?; 
    num: Int;
}

contract OptionalNested {
    data: Container;

    init() {
        self.data = Container{
            nested: OptNested{ innerVal: null, flag: true },
            num: 5
        };
    }
}