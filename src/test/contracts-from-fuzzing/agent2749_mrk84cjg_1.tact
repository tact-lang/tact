struct Inner {
    a: Int;
    b: String;
}

contract TestContract {
    val: Inner;
    
    init() {
        self.val = Inner{a: 1, b: "test"};
    }
}