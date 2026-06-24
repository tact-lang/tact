struct NestedAndOptional {
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?; 
}

contract TestContract {
    data: NestedAndOptional;

    init() {
        self.data = NestedAndOptional{
            nested: Inner{
                x: 10,
                y: null
            }
        };
    }
}