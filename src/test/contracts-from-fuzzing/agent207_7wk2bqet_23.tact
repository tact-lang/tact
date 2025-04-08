struct BigNestedStruct {
    l1: Level1;
    l2: Level2;
}

struct Level1 {
    x: Int;
    y: String;
}

struct Level2 {
    z: Bool;
    w: Address;
}

contract Test21 {
    nested: BigNestedStruct;
    init() {
        self.nested = BigNestedStruct{
            l1: Level1{
                x: 1,
                y: "yo"
            },
            l2: Level2{
                z: true,
                w: myAddress()
            }
        };
    }
}