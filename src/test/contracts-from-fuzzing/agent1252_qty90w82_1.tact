struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    nested: Inner; 

    init() {
        self.nested = Inner{val: 10, flag: true};
    }
}