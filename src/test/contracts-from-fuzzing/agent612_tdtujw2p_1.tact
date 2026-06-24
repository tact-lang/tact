struct InnerStruct { val: Int; optVal: Bool?; }

contract TestDeepOptional {
    data: InnerStruct?;    
    init() {
        self.data = null;
    }
}