struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    val1: Inner;
    val2: Inner;
    val3: Inner;

    init() {
        self.val1 = Inner{a:1,b:true};
        self.val2 = Inner{a:2,b:false};
        self.val3 = Inner{a:3,b:true};
    }
}