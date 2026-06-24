struct Inner {
    flag: Bool;
    count: Int;
}

contract NestedFields {
    info: Inner;
    
    init() {
        self.info = Inner{ flag: true, count: 5 };
    }
}