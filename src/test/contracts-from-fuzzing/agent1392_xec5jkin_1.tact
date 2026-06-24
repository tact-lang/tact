struct SimpleStruct { a: Int; }

contract DeepOptional {
    data: SimpleStruct?;
    
    init() {
        self.data = null;
    }
}