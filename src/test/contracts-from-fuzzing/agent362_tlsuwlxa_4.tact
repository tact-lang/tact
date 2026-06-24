struct Inner {
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    data: Inner;
    
    init() {
        self.data = Inner{ optInt: null, optBool: true };
    }
    
    receive() {
        self.data = Inner{ optInt: 123, optBool: null };
    }
}