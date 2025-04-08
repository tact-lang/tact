struct InnerStruct {
    x: Int;
    y: Int;
}

contract TestContract {
    pos: InnerStruct;   
    
    init() {
        self.pos = InnerStruct{ x: 10, y: 20 };
    }
}