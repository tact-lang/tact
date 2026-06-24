struct InnerStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    z: Int;
}

contract TestContract {
    data: OuterStruct;
    
    init() {
        self.data = OuterStruct{
            inner: InnerStruct{x: 1, y: 2},
            z: 3,
        };
    }
}