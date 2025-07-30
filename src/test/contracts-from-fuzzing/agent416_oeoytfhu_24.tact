struct OStruct {
    x: Int?;
    y: Bool?;
}

struct Container {
    nested: OStruct;
}

contract Test24 {
    data: Container;

    init() {
        self.data = Container{
            nested: OStruct{ x:null, y:true }
        };
    }
}
