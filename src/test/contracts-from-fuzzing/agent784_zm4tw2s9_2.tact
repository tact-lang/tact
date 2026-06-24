struct DeepNested {
    x: Int;
    nested: Inner;
}

struct Inner {
    y: Int;
    nested2: Innermost;
}

struct Innermost {
    z: Int;
    w: Bool?;
}

contract NestedContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            x: 1,
            nested: Inner{
                y: 2,
                nested2: Innermost{
                    z: 3,
                    w: null,
                }
            }
        };
    }
}