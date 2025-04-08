struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    outer1: Inner;
    outer2: Inner?;
    outer3: Inner;

    init() {
        self.outer1 = Inner{x:1,y:true};
        self.outer2 = null;
        self.outer3 = Inner{x:3,y:false};
    }
}