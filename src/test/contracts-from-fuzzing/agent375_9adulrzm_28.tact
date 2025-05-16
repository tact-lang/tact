struct Alternating {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
}

contract TestContract {
    data: Alternating;

    init() {
        self.data = Alternating{
            a:1,b:true,c:2,d:false,e:3,f:true
        };
    }
}
