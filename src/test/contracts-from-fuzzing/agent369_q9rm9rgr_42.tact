struct InnerS {
    x: Int;
    y: Bool;
}

struct OuterS {
    a: Int;
    b: InnerS;
    c: Bool;
}

contract TestContract {
    val: OuterS;
    init() {
        self.val = OuterS{
            a:10,
            b:InnerS{x:5,y:true},
            c:false
        };
    }
}