struct InnerStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    pos: InnerStruct;
    
    init() {
        self.pos = InnerStruct{
            x: 42,
            y: null,
        };
    }
}