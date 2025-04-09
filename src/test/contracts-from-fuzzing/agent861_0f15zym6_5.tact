struct Container {
    val1: Int?; 
    val2: Bool?;
    val3: Slice?;
}

contract OptionalFields {
    data: Container;
    
    init() {
        self.data = Container{};
    }
    
    receive() {
        let _ = self.data;
    }
}