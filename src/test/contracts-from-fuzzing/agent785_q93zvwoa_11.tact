struct Sub {
    x: Int;
    y: Bool;
}

contract TupleStyle {
    t1: Sub;
    t2: Sub;
    t3: Sub;

    init() {
        self.t1 = Sub{x:1,y:true};
        self.t2 = Sub{x:2,y:false};
        self.t3 = Sub{x:3,y:true};
    }
}