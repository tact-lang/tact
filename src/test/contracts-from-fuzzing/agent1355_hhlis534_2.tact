struct Inner {
    val: Int;
    flag: Bool?;
}

contract TestContract {
    data: Inner;
    
    init() {
        self.data = Inner{
            val: 123,
            flag: null,
        };
    }

    receive() {
        // no-op
    }
}