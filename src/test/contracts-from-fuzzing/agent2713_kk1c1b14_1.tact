struct InnerStruct {
    x: Int as uint64;
    y: Int as uint64;
    z: Int?;
}

contract TestContract {
    data: InnerStruct;
    
    init() {
        self.data = InnerStruct{
            x: 1,
            y: 2,
            z: null,
        };
    }
}
