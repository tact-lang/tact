struct Inner {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    ii1: Inner;
    ii2: Inner;

    init() {
        self.ii1 = Inner{x:1,y:true};
        self.ii2 = Inner{x:null,y:null};
    }
}