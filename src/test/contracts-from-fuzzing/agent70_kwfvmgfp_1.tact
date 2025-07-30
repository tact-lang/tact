struct Inner {
    flag: Bool;
    count: Int;
}

contract TestContract {
    innerField: Inner;
    
    init() {
        self.innerField = Inner{ flag: true, count: 5 };
    }
    
    receive() {
        self.innerField = Inner{ flag: false, count: 10 };
    }
}