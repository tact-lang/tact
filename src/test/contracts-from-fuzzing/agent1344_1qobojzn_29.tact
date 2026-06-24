struct MiddleX {
    x: Int;
    y: Int;
}

contract WithManyStructs {
    a: MiddleX;
    b: MiddleX;
    c: MiddleX;

    init() {
        self.a = MiddleX{x:1,y:2};
        self.b = MiddleX{x:3,y:4};
        self.c = MiddleX{x:5,y:6};
    }
}
