struct OptionNested {
    val: Int?;
}

contract TestContract {
    data: OptionNested?;
    
    init() {
        self.data = null;
    }
}