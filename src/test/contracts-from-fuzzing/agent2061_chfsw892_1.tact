struct Inner {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    data: Inner;
    
    init() {
        self.data = Inner{
            val1: 10,
            val2: true,
        };
    }
}
