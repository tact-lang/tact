struct Wrapper {
    first: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
    z: Bool;
}

contract Test {
    state: Wrapper;
    
    init() {
        self.state = Wrapper{
            first: 42,
            inner: InnerStruct{
                x: 1,
                y: null,
                z: true,
            }
        };
    }
}