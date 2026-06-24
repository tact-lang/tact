struct Inner {
    flag: Bool = true;
    value: Int?; 
}

contract DeepNested {
    data: Inner;
    
    init() {
        self.data = Inner{};
    }
}