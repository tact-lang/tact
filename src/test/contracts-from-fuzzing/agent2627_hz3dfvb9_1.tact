struct Inner {
    num: Int;
    flag: Bool;
}

contract TestContract {
    data: Inner;
    
    init() {
        self.data = Inner{num: 7, flag: true};
    }
}