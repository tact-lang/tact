struct NestedOptional {
    name: String?;
    age: Int?;
    flag: Bool?;
}

contract TestContract {
    nop: NestedOptional?;
    
    init() {
        self.nop = null;
    }
}