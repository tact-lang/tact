struct MiddleOptional {
    a: Int;
    b: Int?;
    c: Int;
}

contract OptionalMiddleVar {
    s: MiddleOptional;
    init() {
        self.s = MiddleOptional{a:5,b:null,c:6};
    }
}