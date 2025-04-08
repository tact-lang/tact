struct InnerStruct {
    i1: Int;
    b1: Bool;
}

contract TestContract {
    data: InnerStruct;
    
    init() {
        self.data = InnerStruct{ i1: 1, b1: true };
    }
}