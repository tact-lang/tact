struct SOpt {
    x: Int?;
    y: Bool?;
    z: Slice?;
}

struct HasSOpt {
    first: SOpt?;
    second: SOpt?;
}

contract OptionsInOptions {
    nested: HasSOpt;
    init() {
        self.nested = HasSOpt{
            first: SOpt{
                x:10,y:true,z:emptyCell().asSlice()
            },
            second: null,
        };
    }
}