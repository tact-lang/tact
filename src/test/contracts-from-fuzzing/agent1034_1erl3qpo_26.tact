struct Inner {
    val: Int;
    flag: Bool;
}

contract PartialUpdate {
    nested: Inner;
    
    init() {
        self.nested = Inner{ val: 1, flag: false };
        self.nested.val = 42;
    }
}