struct Inner {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    simple: Inner;
    
    init() {
        self.simple = Inner{ val1: 10, val2: true };
    }
}