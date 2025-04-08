struct InnerStruct {
    a: Int;
    b: Bool;
}

contract SimpleNestedStorage {
    s: InnerStruct;
    
    init() {
        self.s = InnerStruct{a: 1, b: true};
    }
}