struct Layer2 {
    intfield: Int;
    boolfield: Bool;
    sfield: String;
}

struct Layer1 {
    nested: Layer2;
    optionalStr: String?;
}

contract MultiTypeStorage {
    data: Layer1;
    
    init() {
        self.data = Layer1{
            nested: Layer2{intfield: 99, boolfield: false, sfield: "s"},
            optionalStr: null
        };
    }
}