struct Inner {
    val: Int;
    flag: Bool;
}

contract TestNestedPersistentVariables {
    nested: Inner;
    flag: Bool;
    number: Int;
    
    init() {
        self.nested = Inner{ val: 10, flag: true };
        self.flag = false;
        self.number = 5;
    }
}
