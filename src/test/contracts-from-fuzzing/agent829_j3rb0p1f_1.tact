struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    s: InnerStruct;
    
    init() {
        self.s = InnerStruct{
            val1: 10,
            val2: true,
        };
    }
}