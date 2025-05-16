struct InnerStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    coord: InnerStruct;
    
    init() {
        self.coord = InnerStruct{ x: 1, y: null };
    }
}