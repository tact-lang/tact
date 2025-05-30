struct X {
    a: Int;
    b: Bool;
    c: Int;
}
struct Y {
    d: X;
    e: X;
}

contract ManyNested {
    y: Y;
    init() {
        self.y = Y{ d: X{a:1,b:true,c:2}, e: X{a:3,b:false,c:4} };
    }
}