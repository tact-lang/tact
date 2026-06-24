struct Base {
    x: Int
}

message(1) M { y: Int }

contract Fields {
    base: Base;
    msg: M;

    init() {
        self.base = Base{x:5};
        self.msg = M{y:10};
    }
}