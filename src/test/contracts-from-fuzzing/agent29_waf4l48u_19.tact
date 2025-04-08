struct A { x: Int; y: Bool; }

contract ArrayLike {
    zero: A;
    one: A;
    two: A;
    init() {
        self.zero = A{x:0,y:true};
        self.one = A{x:1,y:false};
        self.two = A{x:2,y:true};
    }
}
