struct InnerStruct {
    x: Int?;
    y: Bool;
}

contract TestContract {
    s: InnerStruct?;
    
    init() {
        self.s = InnerStruct{x: null, y: true};
    }
}