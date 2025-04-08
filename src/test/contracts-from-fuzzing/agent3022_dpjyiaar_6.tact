struct Sub {
    x: Int;
    y: Int?;
}

contract MultiOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    sub: Sub?;

    init() {
        self.a = null;
        self.b = 2;
        self.c = null;
        self.sub = Sub{x:5,y:null};
    }
}