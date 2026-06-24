struct InnerStruct {
    x: Int;
    y: Int;
    z: Bool;
}

contract TestContract {
    inner1: InnerStruct;
    inner2: InnerStruct;
    inner3: InnerStruct;
    
    init() {
        self.inner1 = InnerStruct{ x: 1, y: 2, z: true };
        self.inner2 = InnerStruct{ x: 3, y: 4, z: false };
        self.inner3 = InnerStruct{ x: 5, y: 6, z: true };
    }
}