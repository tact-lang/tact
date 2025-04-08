struct Sub {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: Sub?;
    
    init() {
        self.data = null;
    }
}